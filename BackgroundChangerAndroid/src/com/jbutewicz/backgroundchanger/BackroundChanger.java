package com.jbutewicz.backgroundchanger;

import java.util.ArrayList;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;

public class BackroundChanger extends Activity {

	int timeInterval = 2000;

	View backgroundView;
	ArrayList<ArrayList<Integer>> colors = new ArrayList<ArrayList<Integer>>();
	ArrayList<Integer> color = new ArrayList<Integer>();

	Handler pushColorHandler = new Handler();
	Runnable pushColorRunnable = new Runnable() {

		@Override
		public void run() {
			ColorGenerator.pushColor(colors);
			pushColorHandler.postDelayed(this, timeInterval);
		}
	};

	Handler popColorAndUpdateHandler = new Handler();
	Runnable popColorAndUpdateRunnable = new Runnable() {

		@Override
		public void run() {
			backgroundView = (View) findViewById(R.id.BackgroundView);
			color = ColorGenerator.popColor(colors);
			backgroundView.setBackgroundColor(Color.rgb(color.get(0),
					color.get(1), color.get(2)));
			pushColorHandler.postDelayed(this, timeInterval);
		}
	};

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_backround_changer);

		backgroundView = (View) findViewById(R.id.BackgroundView);

		ColorGenerator.pushColor(colors);

		color = ColorGenerator.popColor(colors);

		backgroundView.setBackgroundColor(Color.rgb(color.get(0), color.get(1),
				color.get(2)));

		pushColorHandler.postDelayed(pushColorRunnable, 0);
		popColorAndUpdateHandler.postDelayed(popColorAndUpdateRunnable, 0);

	}

	@Override
	public void onPause() {
		super.onPause();
	}

}
