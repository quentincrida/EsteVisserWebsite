package device_management;

import behaviours.IOutput;

public class Computer {
    private int ram;
    private int hddSize;

//    private Monitor monitor;
    private IOutput outputDevice;

    public Computer(int ram, int hddSize, IOutput outputDevice) {
        this.ram = ram;
        this.hddSize = hddSize;
//        this.monitor = monitor;
        this.outputDevice = outputDevice;
    }

    public int getRam() {
        return this.ram;
    }

    public int getHddSize() {
        return this.hddSize;
    }

//    public Monitor getMonitor() {
//        return this.monitor;
//    }
    public IOutput getOutputDevice() {
        return this.outputDevice;
    }
    public String outputData(String data) {
        return this.outputDevice.outputData(data);
    }
}
