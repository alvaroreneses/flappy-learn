function imgData = fullScreenshot()
    t = java.awt.Toolkit.getDefaultToolkit();
    r = java.awt.Rectangle(t.getScreenSize());
    imgData = screenshot(r.getX(),r.getY(),r.getWidth(),r.getHeight());
end

