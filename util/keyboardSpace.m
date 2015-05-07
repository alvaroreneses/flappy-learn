function [] = keyboardSpace()
    import java.awt.Robot;
    import java.awt.event.*;
    robot = Robot;
    robot.keyPress(KeyEvent.VK_SPACE) 
    robot.keyRelease(KeyEvent.VK_SPACE) 
end