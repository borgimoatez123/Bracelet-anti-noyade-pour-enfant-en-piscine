# 🛟 Anti-Drowning Safety Bracelet for Children

## 📌 Project Overview

This project presents the design and simulation of a **child anti-drowning safety bracelet** implemented using **VHDL on an FPGA**.

The system is designed to detect dangerous situations in a swimming-pool environment and generate an alert when a potential drowning event is detected.

The project focuses on the implementation of a **digital safety system using hardware description language (VHDL)**, including registers, control logic, alert management, and simulation using FPGA development tools.

---

## 🎯 Objectives

The main objectives of this project are:

- Detect potentially dangerous situations for a child in a swimming pool.
- Process safety signals using digital logic.
- Store and manage alert states using registers.
- Generate an appropriate alert signal when a dangerous condition is detected.
- Design the system using **VHDL**.
- Simulate and verify the behavior of the digital architecture before FPGA implementation.
- Develop a modular and easily extensible hardware architecture.

---

## 🏗️ System Architecture

The system is organized into several digital modules responsible for detecting and managing safety events.

### Main components

```text
                  ┌─────────────────────┐
                  │   Safety Sensors    │
                  │                     │
                  │  Water / Position   │
                  │  Emergency Signals  │
                  └──────────┬──────────┘
                             │
                             ▼
                  ┌─────────────────────┐
                  │   Detection Logic   │
                  │                     │
                  │ Dangerous Condition │
                  │      Detection      │
                  └──────────┬──────────┘
                             │
                             ▼
                  ┌─────────────────────┐
                  │   Alert Register    │
                  │                     │
                  │  Store Alert State  │
                  └──────────┬──────────┘
                             │
                             ▼
                  ┌─────────────────────┐
                  │   Control Logic     │
                  │                     │
                  │ Alert Management    │
                  └──────────┬──────────┘
                             │
                             ▼
                  ┌─────────────────────┐
                  │   Alert Output      │
                  │                     │
                  │ LED / Buzzer / etc. │
                  └─────────────────────┘
```

---

## 💻 Technologies

| Technology | Purpose |
|---|---|
| **VHDL** | Hardware description and digital logic design |
| **FPGA** | Target hardware platform |
| **Intel Quartus Prime** | Compilation and synthesis |
| **ModelSim / QuestaSim** | Functional simulation |
| **RTL Viewer** | Visualization of synthesized architecture |
| **Testbench** | Verification of module behavior |

---

## 📂 Project Structure

```text
VHDL/
│
├── src/
│   ├── register_alerts.vhd
│   ├── ...
│
├── simulation/
│   ├── testbench.vhd
│   └── ...
│
├── docs/
│   └── architecture/
│
├── README.md
└── ...
```

> The exact file structure can be adapted according to the final Quartus project organization.

---

## 🔧 Main VHDL Modules

### `register_alerts.vhd`

The alert register is responsible for storing the state of detected alerts.

It allows the system to retain an alert condition according to the control signals and clock behavior.

Typical operations include:

- Resetting the alert register.
- Setting an alert.
- Maintaining the alert state.
- Clearing the alert when the appropriate condition occurs.

Conceptually:

```text
             ┌───────────────┐
   Alert ───►│               │
             │ Alert Register│───► Alert State
   Reset ───►│               │
             │               │
   Clock ───►│               │
             └───────────────┘
```

---

## ⏱️ Clock and Reset

The digital system operates synchronously using a clock signal.

The reset signal initializes the system to a known safe state.

Typical behavior:

```text
RESET = 1
   │
   ▼
Alert Register = 0
System = SAFE
```

After reset:

```text
Danger detected
       │
       ▼
Alert Register = 1
       │
       ▼
Emergency Alert
```

---

## 🧪 Simulation and Verification

Before deploying the design to an FPGA, the VHDL modules are verified using a **testbench**.

The testbench generates different input scenarios and verifies that the outputs correspond to the expected behavior.

### Example test scenarios

| Test | Condition | Expected Result |
|---|---|---|
| 1 | Reset activated | Alert cleared |
| 2 | Normal swimming | No alert |
| 3 | Dangerous condition detected | Alert activated |
| 4 | Alert remains active | Alert state maintained |
| 5 | Alert cleared | System returns to safe state |
| 6 | Reset during alert | Alert cleared |

---

## 📊 RTL Design

The project can be inspected using the **RTL Viewer** provided by Quartus Prime.

The RTL representation makes it possible to verify the generated hardware structure and ensure that the VHDL description corresponds to the intended digital architecture.

The design contains sequential and combinational logic used to manage the safety states and alerts.

---

## ⚙️ Compilation

The project can be compiled using:

**Intel Quartus Prime 20.1**

Basic compilation workflow:

```text
VHDL Source
     │
     ▼
Analysis & Synthesis
     │
     ▼
Fitter
     │
     ▼
Assembler
     │
     ▼
FPGA Configuration
```

---

## 🚀 How to Run the Project

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
```

### 2. Open the project

Open the Quartus project:

```text
File → Open Project
```

Select the project's `.qpf` file.

### 3. Compile

Run:

```text
Processing → Start Compilation
```

### 4. Run the simulation

Open the simulation environment and compile the VHDL sources and testbench.

Then execute the simulation and observe the relevant signals.

Example:

```text
Clock
Reset
Danger Detection
Alert Register
Alert Output
```

---

## 🔬 Design Methodology

The project follows a standard digital-system design workflow:

```text
Requirements
     │
     ▼
System Architecture
     │
     ▼
VHDL Design
     │
     ▼
Testbench Development
     │
     ▼
Functional Simulation
     │
     ▼
RTL Analysis
     │
     ▼
Synthesis
     │
     ▼
FPGA Implementation
```

This methodology allows errors in the digital logic to be detected during simulation before deployment to physical hardware.

---

## 🛡️ Safety Concept

The bracelet is intended as a **safety-assistance system** rather than a replacement for adult supervision or certified aquatic safety equipment.

The digital architecture can be extended with additional sensors and communication mechanisms to improve the detection and notification capabilities.

Possible future extensions include:

- 📡 Wireless communication with a smartphone.
- 📍 GPS-based location tracking.
- 📱 Mobile emergency notifications.
- 🔊 Local buzzer alarm.
- 💡 Visual LED indicators.
- 🌊 Water-contact detection.
- 📐 Motion and orientation analysis.
- 🔋 Battery-level monitoring.
- 📊 Event logging.

---

## 🔮 Future Improvements

Future versions could introduce a more advanced state machine:

```text
          ┌───────────┐
          │   SAFE    │
          └─────┬─────┘
                │
          Dangerous Event
                │
                ▼
          ┌───────────┐
          │  WARNING  │
          └─────┬─────┘
                │
        Critical Condition
                │
                ▼
          ┌───────────┐
          │  ALERT    │
          └─────┬─────┘
                │
          Recovery / Reset
                │
                ▼
          ┌───────────┐
          │   SAFE    │
          └───────────┘
```

This approach would make the system more robust by explicitly modeling the different safety states instead of treating the alert as a simple binary signal.

---

## 📚 Academic Context

This project was developed as part of an **FPGA / VHDL digital systems project**, with the objective of applying concepts related to:

- Digital electronics
- Hardware description languages
- Sequential logic
- Registers
- Finite-state machines
- FPGA architecture
- RTL design
- Hardware simulation
- Verification and testing

---

## 👨‍💻 Author

**Moatez Borgi**
**Emna Riahi**
**Nessim Mezhoud**
**Rayen Askri**
**Ismail Bouchnak**
**Ezzdine Chemak**
Software Engineering / Embedded Systems Engineering Student

Tunisia 🇹🇳

---

## 📄 License

This project is intended for **educational and academic purposes**.

You are free to study and modify the source code for learning and experimentation.
