package fr.imt_lille_douai.helloworld;

import android.app.Activity;
import android.os.Bundle;
import android.widget.EditText;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EditText t = new EditText(this);
        t.setText("Hello World");
        t.setTextSize(80);

        setContentView(t);
    }
}