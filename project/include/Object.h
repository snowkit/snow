#ifndef LUMEN_HXOBJECT_H
#define LUMEN_HXOBJECT_H


namespace lumen {


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

            // virtual int getApiVersion() { 
            //     return NME_API_VERSION; 
            // }
        
    }; //Object

} //namespace lumen

#endif //LUMEN_HXOBJECT_H