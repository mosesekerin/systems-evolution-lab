# Single-Node Systems Evolution

## Engineering Training Playbook

### Objective

The objective of this project is to develop **deep system-level understanding of application deployment** by building and evolving a **single-node production system** from first principles.

This exercise is not about tools.

It is about understanding:

* how systems are constructed
* where system state lives
* how failures propagate
* why modern infrastructure abstractions exist

The system will evolve progressively from **manual operation to structured automation** through controlled failure exploration.

All team members must follow the procedures described in this document.

---

# System Architecture Being Studied

The system under study is a **single-node stateful web application** running on a Linux VM.

Application characteristics:

* Node.js monolithic application
* Express web server
* EJS server-side rendering
* JSON file persistence
* structured logging
* process lifecycle managed by systemd

All components run on a **single machine**.

This intentionally creates tight coupling so that **system behavior and failure propagation are clearly observable**.

---

# System Layers

The system will be analyzed through **seven interacting layers**.

Every team member must understand how these layers interact.

## 1. Infrastructure Layer

Responsible for machine provisioning.

Components include:

* VM instance
* firewall rules
* public IP address
* disk storage
* CPU and memory allocation

---

## 2. Operating System Layer

Responsible for the base execution environment.

Components include:

* Linux distribution
* system users
* file permissions
* package management
* open ports

---

## 3. Runtime Environment Layer

Responsible for application execution dependencies.

Components include:

* Node.js installation
* npm dependencies
* environment variables

---

## 4. Application Layer

Responsible for application behavior.

Components include:

* Express server
* EJS rendering
* application logic
* JSON database file

---

## 5. Process Lifecycle Layer

Responsible for process supervision.

Components include:

* systemd service
* restart policies
* process monitoring

---

## 6. Deployment Workflow Layer

Responsible for delivering application versions.

Current deployment model:

* SSH into machine
* clone repository
* install dependencies
* restart application

---

## 7. Observability Layer

Responsible for system visibility.

Components include:

* application logs
* systemd logs
* process inspection commands

---

# Phase 1 — System Mapping

## Goal

Phase 1 is **not about deploying an application**.

Phase 1 is about **building a complete mental model of the system**.

By the end of Phase 1 every team member must be able to explain:

* what components exist in the system
* where system state lives
* how the system starts
* what assumptions the system depends on
* how the system is observed
* what happens when the machine reboots

If any team member cannot explain the entire system lifecycle from memory, **Phase 1 is not complete**.

---

# Phase 1 Execution Requirements

Every team member must perform **manual deployment of the entire system multiple times from scratch**.

Typical workflow:

1. Create VM instance
2. SSH into server
3. Install required packages
4. Install Node.js
5. Clone application repository
6. Install npm dependencies
7. Configure environment variables
8. Create systemd service
9. Start application
10. Verify system availability

Do not treat this as a checklist.

Every command must be understood.

---

# Phase 1 Deliverables

Phase 1 must produce **three documented artifacts**.

---

## 1. System Map

Document the structure of the system.

Example structure:

```
Infrastructure
   VM instance
   firewall rules
   public IP

Operating System
   Linux OS
   installed packages
   users
   ports

Runtime
   Node.js version
   npm dependencies
   environment variables

Application
   Express server
   EJS templates
   JSON database

Process Lifecycle
   systemd service

Deployment Workflow
   SSH
   git clone
   npm install
   restart service

Observability
   logs
   systemd journal
```

---

## 2. State Map (Critical)

The team must document **all locations where system state exists**.

Example:

```
Infrastructure state
   VM configuration

Filesystem state
   application repository
   node_modules
   JSON database
   log files

Runtime state
   process memory
   environment variables

Process state
   systemd service status
```

Most production failures occur because **state is misunderstood or corrupted**.

---

## 3. Execution Flow

The team must document the exact lifecycle of the system.

Example:

```
Create VM
SSH into server
Install Node.js
Clone repository
Install dependencies
Configure environment variables
Create systemd service
Start service
Verify system availability
```

The team must also document the **system behavior after machine reboot**.

---

# Mandatory System Investigation Mindset

During Phase 1 every engineer must behave like a **system investigator**.

For every command executed, ask:

* What did this command create?
* Where is the file located?
* Who owns the file?
* What process uses this file?

For every file discovered, ask:

* Which process reads this file?
* Which process writes to it?
* What happens if this file disappears?

For every process observed, ask:

* Who started this process?
* What service controls it?
* What happens if the process dies?

These questions must be answered before proceeding.

This investigative approach is **how system thinking develops**.

---

# Phase 1 Validation Tests

After deployment is complete, every engineer must test system behavior.

Mandatory tests include:

### Process crash

Kill the application process and observe systemd behavior.

### Machine reboot

Run:

```
sudo reboot
```

Then observe:

* Does systemd restart the application?
* Does the JSON database still exist?
* Do logs persist?
* Does networking still work?

Reboot often exposes hidden assumptions.

---

# Phase 2 — Controlled Failure Exploration

Once the system is fully understood, the team will begin **intentional failure testing**.

Failures must be introduced deliberately to observe how the system behaves.

Examples include:

* instance restart
* disk exhaustion
* runtime misconfiguration
* interrupted deployments
* corrupted application state
* process crash loops

Failures must be studied **across system layers**.

---

# Failure Investigation Procedure

Every failure must follow this investigation workflow.

```
Trigger failure
Observe system behavior
Identify failure class
Trace cross-layer impact
Determine root cause
Document findings
```

The objective is to understand **how failures propagate through the system**.

---

# Phase 3 — Progressive System Abstraction

After failures are understood, the team will introduce **abstractions that solve observed problems**.

Tools must only be introduced **after the underlying system problem is understood**.

Each abstraction must be validated by **running the entire system deployment again**.

---

# Layer Optimization Procedure

For each system layer the following loop must be executed:

```
Select layer to improve
Trigger realistic failures
Observe cross-layer effects
Identify failure class
Study underlying system concept
Introduce appropriate abstraction
Rebuild that layer
Run full deployment workflow
Verify improvement
```

Other layers remain unchanged until their turn.

---

# Final Outcome

By the end of this project the team must understand:

* where system state lives
* how failures propagate across layers
* why infrastructure abstractions exist
* how deployment automation evolved
* how real systems are designed for resilience

The result should not be tool familiarity.

The result should be **deep systems engineering intuition**.

