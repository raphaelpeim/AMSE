package fr.imt_lille_douai.tp2;

import android.animation.ObjectAnimator;
import android.graphics.Path;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.animation.Animation;
import android.widget.ImageView;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ImageView asteroid1 = findViewById(R.id.asteroid1);
        ImageView asteroid2 = findViewById(R.id.asteroid2);
        ImageView spaceShip = findViewById(R.id.spaceShip);
        ImageView button = findViewById(R.id.button);

        Path path = new Path();
        path.arcTo(0f, 0f , 1000f, 1000f, 0f , 359f, true);
        ObjectAnimator animatorsOfAsteroid = ObjectAnimator.ofFloat(asteroid1, View.X, View.Y, path);
        animatorsOfAsteroid.setDuration(4000);
        animatorsOfAsteroid.setRepeatCount(Animation.INFINITE);
        animatorsOfAsteroid.start ();
    }
}