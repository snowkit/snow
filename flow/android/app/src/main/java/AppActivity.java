package {{project.app.package}};

import android.os.Bundle;
import android.util.Log;

public class AppActivity extends org.snowkit.snow.SnowActivity {

    public void onCreate(Bundle savedInstanceState) {
        
        super.onCreate(savedInstanceState);

        Log.i("SNOW", ">>>>>>>>/ Your App Activity / On Create .....");

    }

        //Add native lib dependencies here, if any.
        //"libgame.so" would just be "game",
        //See System.loadLibrary documentation.
        //Order may matter, as does keeping the project native lib first
    protected String[] getLibraries() {
        return new String[] {
            "{{project.app.name}}"
        };
    }


} //AppActivity

