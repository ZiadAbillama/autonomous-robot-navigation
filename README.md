# 🤖 Autonomous Robot Navigation (RISC-V Assembly)

A low-level autonomous navigation system implemented entirely in **RISC-V assembly**.  
This project demonstrates how a robot can use **infrared (IR)** and **ultrasonic sensors** to detect obstacles and control motor movement in real time, which is an essential task in robotics systems operating in **hazardous or inaccessible environments**.

---

## ✨ Features

- 📡 **Sensor Integration** – Processes IR and ultrasonic sensor inputs for obstacle detection.  
- 🧠 **Decision-Making Logic** – Uses conditional branching to choose actions (forward, turn, stop).  
- ⚙️ **Motor Control Simulation** – Sends control commands using system calls in the RARS simulator.  
- 🔁 **Real-Time Processing** – Continuously reads, interprets, and reacts to sensor data.

---

## 🧱 System Architecture

The navigation system operates in four main stages:

1. **Initialize Sensor Input Ports** – Configure memory-mapped addresses for sensor reading.  
2. **Read Sensor Data** – Continuously poll IR and ultrasonic sensor values.  
3. **Decision Logic** – Use branching to determine motion commands.  
4. **Motor Command Execution** – Simulate movement with system calls.

---

## 📂 Project Structure

📁 autonomous-robot-navigation/  
├── nav.asm            # Main RISC-V navigation algorithm  
├── report.docx        # Full project report and documentation    
└── README.md          # Project documentation  

---

## 🚀 How to Run

**1. Download and install the RARS RISC-V simulator**: [RARS GitHub](https://github.com/TheThirdOne/rars)  
**2. Clone this repository or download the ZIP:

```bash
git clone https://github.com/YourUsername/autonomous-robot-navigation.git
cd autonomous-robot-navigation
```
3. Open the nav.asm file in RARS  
4. Assemble and run the program  
5. When prompted, enter sensor values:  
