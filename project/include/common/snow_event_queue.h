#ifndef _SNOW_IO_EVTQUEUE_H_
#define _SNOW_IO_EVTQUEUE_H_

#ifdef HX_WINDOWS
    #include <windows.h>
#endif

namespace snow {

    namespace io {

            // highperf lockfree lifo eventqueue, based on:
            // http://www.1024cores.net/home/lock-free-algorithms/queues/intrusive-mpsc-node-based-queue
            // It's *almost* lockfree since it can block the consumer in (*) in theory, but even
            // the consumer just waits till he can grab the item. the producers are not affected.
        struct event_node_t {

            event_node_t* volatile  next;
            FileWatchEvent* event;

        }; // event_node_t

        struct eventqueue_t {

            event_node_t* volatile  head;
            event_node_t*           tail;
            event_node_t            stub;

        }; // eventqueue_t

        void            eventqueue_create(eventqueue_t* self);
        void            eventqueue_push(eventqueue_t* self, event_node_t* node);
        event_node_t*   eventqueue_pop(eventqueue_t* self);


        inline void eventqueue_create(eventqueue_t* self) {

            self->head = &self->stub;
            self->tail = &self->stub;
            self->stub.next = 0;

        } //eventqueue_create

        inline void eventqueue_push(eventqueue_t* self, event_node_t* node) {

            node->next = 0;

            #ifdef HX_WINDOWS
                event_node_t* prev = (event_node_t*)InterlockedExchangePointer((PVOID*)&self->head, (PVOID)node);
            #else
                    //:todo:
                #error "Not implemented"
                event_node_t* prev = NULL;
            #endif

            //(*)
            prev->next = node;

        } //eventqueue_push

        inline event_node_t* eventqueue_pop(eventqueue_t* self) {

            event_node_t* tail = self->tail;
            event_node_t* next = tail->next;

            if( tail == &self->stub ) {

                if (0 == next) {
                    return 0;
                }

                self->tail = next;
                tail = next;
                next = next->next;

            }

            if( next ) {
                self->tail = next;
                return tail;
            }

            event_node_t* head = self->head;
            if( tail != head ) {
                return 0;
            }

            eventqueue_push(self, &self->stub);

            next = tail->next;
            if( next ) {
                self->tail = next;
                return tail;
            }

            return 0;

        } //eventqueue_pop


    } // io namespace

} // snow namespace

#endif //_SNOW_IO_EVTQUEUE_H_
