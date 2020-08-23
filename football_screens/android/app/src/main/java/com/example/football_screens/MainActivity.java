package com.example.football_screens;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraManager;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.example.football_screens/flashlight";
    private static final int CAMERA_REQUEST = 50;
    //private final boolean hasFlashlight = getPackageManager().hasSystemFeature(PackageManager.FEATURE_CAMERA_FLASH);
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        //requestPermission();
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        .setMethodCallHandler(
            (call, result) -> {
            switch (call.method)
            {
                case "turnOnFlashlight":
                    turnOnFlashlight();
                    break;

                case "turnOffFlashlight":
                    turnOffFlashlight();
                    break;
            }
    }
        );
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

    }

    private void requestPermission() {
        ActivityCompat.requestPermissions(MainActivity.this,
                new String[] {Manifest.permission.CAMERA}, CAMERA_REQUEST);
    }

    private void turnOnFlashlight(){
//        if (hasFlashlight)
//        {
            CameraManager cameraManager = (CameraManager) getSystemService(Context.CAMERA_SERVICE);
            try {
                String cameraId = cameraManager.getCameraIdList()[0];
                cameraManager.setTorchMode(cameraId, true);
            } catch (CameraAccessException e) {

            }
  //      }
    }

    private void turnOffFlashlight(){
        requestPermission();
//        if (hasFlashlight)
//        {
            CameraManager cameraManager = (CameraManager) getSystemService(Context.CAMERA_SERVICE);
            try {
                String cameraId = cameraManager.getCameraIdList()[0];
                cameraManager.setTorchMode(cameraId, false);
            } catch (CameraAccessException e) {

            }
        }
 //   }
}

