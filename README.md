# FPGA Projects – DC Motor & Servo Motor controlled via Bluetooth

Check out the video of this project in action:
https://www.linkedin.com/feed/update/urn:li:activity:6739399764095315968/

The DC motor project uses a Xilinx Artix-7 FPGA with a DC motor controlled through Bluetooth via a custom made Android app.  The app can control the direction and speed of the DC motor.  The seven-segment display on the BASYS-3 displays the percentage of the PWM signal's duty cycle as the LEDs move left and right proportional to the motor's speed.  

The Servo project uses the phone's internal accelerometer to change the position of the servo.  The phone rotation is directly proportional to the servo rotation (e.g., if you rotate the phone 36 degrees, the servo will rotate 36 degrees, and so on).  The seven-segment display shows the servo's degree angle: from 0 degrees to 180 degrees, and the LEDs move left and right proportional to the rotation.  The app also provides the option of locking the servo in the desired position.  
