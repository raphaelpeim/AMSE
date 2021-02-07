package fr.imt_lille_douai.helloworld2;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;

public class MainActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LinearLayout l1 = new LinearLayout(this);
        l1.setOrientation (LinearLayout. VERTICAL);
        final EditText t = new EditText(this);
        Button b = new Button(this);
        b.setText("Say hello");
        b.setHeight(200);
        b.setOnClickListener (new View.OnClickListener() {
            public void onClick(View v) {
                t.setText("Hello");
            }
        });
        l1.addView(t);
        l1.addView(b);
        setContentView(l1);
    }
}
