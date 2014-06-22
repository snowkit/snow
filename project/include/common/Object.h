#ifndef _SNOW_HXOBJECT_H_
#define _SNOW_HXOBJECT_H_


namespace snow {

// native object wrapper tools

    class Object {

        public:

            int ref_count;

        protected:

            virtual ~Object() {}

        public:

            Object( bool has_initial_ref = false ) : ref_count( has_initial_ref ? 1 : 0 ) {}

            Object *grab() {

                ref_count++;

                return this;

            } //grab

            void drop() {

                ref_count--;

                if( ref_count <= 0 ) {
                    delete this;
                }

            } //drop

    }; //Object

} //snow namespace

#endif //_SNOW_HXOBJECT_H_