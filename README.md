
# Process Scheduling Instances

Here we provide a set of randomly generated instances of network-based, batch scheduling problems. Each instance is provided as a [GAMS](https://www.gams.com/) Data eXchange ([GDX](https://www.gams.com/latest/docs/UG_GDX.html#:~:text=A%20GDX%20file%20is%20a,model%20using%20different%20parameters%20etc.)) file and is contained in its own folder. 

Each instance contains the following data:

1. Set of *Tasks* that may be carried out
2. Set of *Units* that can process tasks
3. Set of *Materials* that can be produced/consumed by tasks
4. *Units_That_Can_Process_Tasks* -- For each task, the set of units that can process that task
5. *Processing_Costs* --  For each task, the cost to process that task on each unit
6. *Processing_Times* --  For each task, the time to process that task on each unit
7. *Converstion_Coefficients* --  For each task, the amount of each material produced/consumed per unit batch size
8. *Min_Unit_Capacity* -- The minimum batch size that can be carried out in each unit
9. *Max_Unit_Capacity* -- The maximum batch size that can be carried out in each unit
10. *Material_Initial_Inventory* -- The initial inventory of each material
11. *Material_Storage_Capacity* -- The amount of each material that can be stored at any given time
12. *Material_Selling_Price* -- The price at which each material can be sold (0 for materials that are not final products)
13. *Material_Demand_Per_48hr*  -- The total demand for each material in each 48hr time period. Note that we make the following assumptions:
    - All demand is satisfied at the end of the scheduling horizon.
    - This value is continuous. For example, if the total scheduling horizon is 36hrs, the total demand is 0.75 times this value.
    
The naming convention for each instance is "random_instance_i_j_ka.gdx," where *i*, *j*, and *k* indicate the number of tasks, units, and materials, respectively.

We also include an [R](https://cran.r-project.org/) script titled "convert_gdx_to_xlsx.R" that can be used to convert an individual GDX instance file to a Microsoft Excel file, if desired. An example of using the script can be found within.
