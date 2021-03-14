package com.example.jeustarwars;

import android.animation.Animator;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.app.Activity;
import android.animation.ObjectAnimator;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;

import androidx.annotation.RequiresApi;

import java.util.Random;

public class MainActivity extends Activity {
    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    protected float x;
    protected float y;
    protected boolean isPressed = false;
    protected boolean isCrashed = false;
    protected ImageView[] asteroids = new ImageView[1];

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ImageView spaceShip = (ImageView) findViewById(R.id.spaceShip);
        ImageView ast1 = (ImageView) findViewById(R.id.Asteroid1);

        asteroids[0] = ast1;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            ObjectAnimator anim = ObjectAnimator.ofFloat(ast1, "translationY", 500f);
            anim.setDuration(2000);
            ObjectAnimator animation2 = ObjectAnimator.ofFloat(ast1, "translationX", 500f);
            animation2.setDuration(2000);

            anim.addListener(new Animator.AnimatorListener() {
                @Override
                public void onAnimationStart(Animator animation) {}

                @Override
                public void onAnimationEnd(Animator animation) {
                    animation2.start();
                }

                @Override
                public void onAnimationCancel(Animator animation) {}

                @Override
                public void onAnimationRepeat(Animator animation) {}
            });

            animation2.addListener(new Animator.AnimatorListener() {
                @Override
                public void onAnimationStart(Animator animation) {}

                @Override
                public void onAnimationEnd(Animator animation) {
                    anim.start();
                }

                @Override
                public void onAnimationCancel(Animator animation) {}

                @Override
                public void onAnimationRepeat(Animator animation) {}
            });

            animation2.start();
        }

        ImageView exp = (ImageView) findViewById((R.id.explosion));

        if(!isCrashed) {
            exp.setVisibility(View.INVISIBLE);
        }

        Handler handlerForMovingTie = new Handler();
        Runnable movingTie = new Runnable() {
            @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)

            @Override
            public void run() {
                for(int i = 0; i < asteroids.length; i++){
                    if(bumpEachOther(spaceShip, asteroids[0])){
                        exp.setX(spaceShip.getX());
                        exp.setY(spaceShip.getY());
                        exp.setVisibility(View.VISIBLE);
                        isCrashed=true;
                    }
                }

                if(!isCrashed) {
                    spaceShip.setX(spaceShip.getX() + x / 30);
                    spaceShip.setY(spaceShip.getY() + y / 30);

                    if (isPressed) {
                        handlerForMovingTie.postDelayed(this, 10);
                    }
                }
            }
        };

        ImageView exterior = (ImageView) findViewById(R.id.pad_exterior);
        ImageView center = (ImageView) findViewById(R.id.pad_center);

        center.setOnTouchListener(new View.OnTouchListener(){
            @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
            public boolean onTouch(View myView, MotionEvent event) {
                int[] outLocationExterior = new int[2];
                int action = event.getAction();

                exterior.getLocationOnScreen(outLocationExterior);

                if (action == MotionEvent.ACTION_DOWN) {
                    isPressed = true;
                    x = event.getRawX() - (outLocationExterior[0] + exterior.getWidth()/2);
                    y = event.getRawY() - (outLocationExterior[1] + exterior.getHeight()/2);

                    handlerForMovingTie.postDelayed(movingTie, 10);
                };

                if (action == MotionEvent.ACTION_MOVE) {
                    x = event.getRawX() - (outLocationExterior[0]+exterior.getWidth()/2);
                    y = event.getRawY() - (outLocationExterior[1]+exterior.getHeight()/2);
                    float r = exterior.getWidth()/2;

                    if(x*x+y*y > r*r) {
                        center.setX((float) ((r*x/Math.sqrt(x*x+y*y)) + center.getWidth()/2)+exterior.getWidth());
                        center.setY((float) ((r*y/Math.sqrt(x*x+y*y)) + center.getHeight()/2));
                    }
                    else {
                        center.setX(x + exterior.getWidth());
                        center.setY(y);
                    }
                };

                if (action == MotionEvent.ACTION_UP) {
                    isPressed = false;
                    center.setX((exterior.getLeft() + exterior.getWidth()/2) - center.getWidth()/2);
                    center.setY((exterior.getTop() + exterior.getHeight()/2) - center.getHeight()/2);
                };

                return true;
            }
        });
    }

    public boolean bumpEachOther(ImageView firstView, ImageView secondView){
        int[] firstPosition = new int[2];
        int[] secondPosition = new int[2];

        firstView.getLocationOnScreen(firstPosition);
        secondView.getLocationOnScreen(secondPosition);
        Rect rectFirstView = new Rect(firstPosition[0],firstPosition[1],
                firstPosition[0]+firstView.getMeasuredWidth(),firstPosition[1]+firstView.getMeasuredHeight());
        Rect rectSecondView = new Rect(secondPosition[0], secondPosition[1],
                secondPosition[0]+secondView.getMeasuredWidth(), secondPosition[1]+secondView.getMeasuredHeight());
        Rect inter = new Rect();

        if(inter.setIntersect(rectFirstView, rectSecondView)) {
            double insideArea = inter.width()*inter.height();
            double secondViewArea = rectSecondView.width()*rectSecondView.height();

            if(insideArea >= 0.2*secondViewArea) {
                return true;
            }
        }

        return false;
    }
}