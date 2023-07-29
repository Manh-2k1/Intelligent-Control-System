<p align="center">
 <h1 align="center">Intelligent Control System</h1>
</p>

# Introduction
This project implements modeling of a 2-degree-of-freedom robotic arm system. Then design fuzzy PD controller, design neural network approximating fuzzy controller and use GA algorithm to determine optimal PID controller parameters.

# Modeling of a 2-DOF robotic arm 
2-DOF robot model is given as shown below:

<p align="center">
  <img src="images/robot_2dof.png" width=300><br/>
  <i>Robot 2-DOF</i>
</p>

The parameters of 2-DOF robot are presented in this file **Final_project.pptx**.

# Fuzzy Logic (FL)
The object of controlling the robot with 2 degrees of freedom is a MIMO system, but we use the SISO fuzzy controller according to the decoupling principle, each fuzzy controller will control the operation for each joint of the Robot.

<p align="center">
  <img src="images/PD_Fuzzy.png" width=400><br/>
  <i>PD Fuzzy controller</i>
</p>

# Neural Networks (NN)
The neural controller is created based on the signal transmission and processing mechanism of the human brain. The construction of the neural controller is to create an artificial neural network that mimics the working process of the human brain. The essence of an artificial neural network is a distributed parallel computing network.

<p align="center">
  <img src="images/neural.png" width=400><br/>
  <i>Predictive neural network model</i>
</p>

# Genetic Algorithm (GA)
Genetic Algorithm (GA) is an algorithm that searches for the optimal solution on the principle of guesswork according to the evolutionary process and genetic laws of organisms in nature. In genetic algorithms for optimization problems, the idea is that a set of chromosomes in individuals will be allowed to evolve toward a selection of progressively better solutions.

<p align="center">
  <img src="images/GA.png" width=200><br/>
  <i>Genetic Algorithm Flowchart</i>
</p>

# Simulation results
Output response of joints (left picture is joint 1, right is joint 2).

* **Fuzzy Logic:**

<div style="display: flex;">
  <img src="images/fuzzy_joint1.png" width="400">
  <img src="images/fuzzy_joint2.png" width="400">
</div>

* **Neural Networks:**

<div style="display: flex;">
  <img src="images/neural_joint1.png" width="400">
  <img src="images/neural_joint2.png" width="400">
</div>

* **Genetic Algorithm:**

<div style="display: flex;">
  <img src="images/GA_joint1.png" width="400">
  <img src="images/GA_joint2.png" width="400">
</div>

# Video Design intelligent controllers for a 2-DOF manipulator
https://youtu.be/SbA-9qXNue8
