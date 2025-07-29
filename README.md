# KNOW-PLAN
ROS package to use a knowledge base to represent and reason with knowledge about plans for plan comparison and selection (disambiguation). This package allows to run the knowledge base using *rosprolog*, which includes features to be used within ROS (e.g., one can query the knowledge base calling a ROS service). 


### Dependencies to use a rosprolog-based knowledge base

Make sure that you have installed wstool and that you have initialized a workspace. 
```
sudo apt install python3-wstool

wstool init <your_catkin_ws>/src
```

Now let's proceed with the installation of dependencies.
```
sudo apt install swi-prolog libjson-glib-dev

sudo apt install python-rdflib

wstool set know_plan --git https://github.com/albertoOA/know_plan.git

wstool update know_plan

wstool merge know_plan/rosinstall/know_plan.rosinstall

wstool update 
```


### Python3 virtual environment configuration and dependencies to use rosplan together with the rosprolog knowledge base

In the package, we already provide a virtual environment but it was built for our computer and it will probably not work in yours. You can easily delete it and create and configure your own environment executing the following commands in a terminal. (note that python3-venv needs to bee installed)

```
cd <know_plan_folder>/python_environment
python3 -m venv know_plan_rosplan
source know_plan_rosplan/bin/activate

python3 -m pip install wheel catkin_pkg rospkg pyyaml future
```

### Building

```
roscd; cd ..

catkin_make -DCATKIN_WHITELIST_PACKAGES="know_plan;comp_spatial;knowrob_common;rosprolog;json_prolog_msgs;rosowl;genowl"
```

### Running a rosprolog-based knowledge base for collaborative robotics and adaptation
One can also run a knowledge base with all the knowledge stored in an episodic memory, *contrastive_plans/validation neem*, which is related to the research discussed during article [1].

```
roslaunch know_plan map_cra_cs_bringing_object_plan_disambiguation_with_recorded_neem.launch
```


### Running a planning domain-agnostic knowledge base for objective evaluation of narratives 
The idea here is to run a generic knowledge base in which knowledge about two different plans will be stored for later comparison, contrastive selection and narration.  

The next example assumes that ROSPlan is already installed, following the instructions on the gihtub README: [https://github.com/KCL-Planning/ROSPlan](https://github.com/KCL-Planning/ROSPlan).

```
roslaunch know_plan map_cra_cs_generic.launch
```

Now it is time to generate a couple of plans for a target domain and problem. In order to have two different plans for the same problem, it will be necessary to run twice the launch file modifying the argument *'evaluation'*. When it is set to 'false', the planner will take the first plan that is found after 1 second of graph search, if it is set to 'true' the planner will search during 120 seconds. Very oftent, the generated plan after 120 seconds will be better, but note that it will not always be true. In any case, two plans will be generated and their knowledge asserted to the knowledge base, where they will be compared using logical reasoning rules written in Prolog. Remember, you need to run the launch with *'evaluation'* set to 'false', close the execution and run it again with the argument set to 'true'. 

```
roslaunch know_plan rosplan_cra_cs_generic.launch 
``` 



**[1]** A. Olivares-Alarcos, S. Foix, J. Borràs, G. Canal and G. Alenyà. (2024). Ontological modeling and reasoning for comparison and contrastive narration of robot plans. In Proceedings of the 2024 International Conference on Autonomous Agents and Multiagent Systems (AAMAS), 2024, Auckland, New Zealand, to appear.
