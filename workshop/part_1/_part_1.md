
## Part 1. 
![alt text](<Screen Shot 2024-03-22 at 12.19.45 PM.png>)
![alt text](<Screen Shot 2024-03-22 at 12.19.59 PM.png>)
![alt text](<Screen Shot 2024-03-22 at 12.20.07 PM.png>)
![alt text](<Screen Shot 2024-03-22 at 12.20.15 PM.png>)
![alt text](<Screen Shot 2024-03-22 at 12.20.22 PM.png>)


|  | |
|-|-|
| `pwd` | | 
| `ls` | ```cd FOLDER```| 
| hey | ```cd FOLDER```| 
| hey | ```cd FOLDER```| 
### Activity #1: Let's Run Our First Analysis with the Command Line
> Goal: We're going to use the bash commands mentioned above to perform a simple analysis using command lines.

1. Open Terminal (Mac) or Git Bash (Windows).
2. Check the current directory (where you are right now) using `pwd`.
    ```
    pwd
    ```

3. Navigate to the folder where you downloaded the materials using the `cd FOLDER` command. You can use the Tab key to see matching results, which will reduce the amount of typing.
    ```
    cd Downloads/DVA_workshop/DVA_workshop
    ```
4. Check if we have all the folders using `ls [FOLDER]`.
    ```
    ## to list items in current folder
    ls      
    ```

    ```
    ## list items in rawdata_control folder
    ls rawdata_control  
    ```
5. We are going to save our analysis results in a separate folder. Create a result_control folder to save the results using the `mkdir [FOLDER]` command.
       ```
    mkdir result_control
    ```
6. Use the command line to run the analysis. Here, we are going to use the R program with a script, but these command lines could be anything that you would like to use, as long as the program has a CLI (Command Line Interface).
      ```
    ##      SCRIPT_FILENAME   INPUT_FILENAME_IF_NEEDED   OPTIONS
    Rscript script_analysis.r rawdata_control/data_1.csv 1
    ```

    ```
    ## other example, which is BEAST program for phylodynamic analysis
    ## don't run this command 
    BEAST input.xml
    ```





### Activity #2: Using for-loops for running repeated analysis over multiple datasets

Goal: We're going to utilize a for-loop to efficiently repeat analyses across different datasets.

Imagine we need to conduct the same analysis for 10 experimental groups. We could manually typing script from Activity #1 for each group as shown below, but with a large number of datasets, this method becomes time-consuming and prone to typos and errors.

```
mkdir result_experimental00
Rscript script_analysis.r rawdata_experimental00/inputdata_1.csv

mkdir result_experimental01
Rscript script_analysis.r rawdata_experimental01/inputdata_1.csv

mkdir result_experimental02
Rscript script_analysis.r rawdata_experimental02/inputdata_1.csv

## keep goes on...
```



Instead, we'll use a for-loop to iterate over the datasets we want to analyze. We'll place the command lines inside a for-loop. In the commands above, the only changing part is the number following result_experimental_. Our for-loop will iterate over these numbers. The structure is as follows:

```
for var in VALUES_TO_ITERATE; do 
  COMMAND_LINES_TO_REPEAT 
  COMMAND_LINES_TO_REPEAT_WITH_THE_VALUE ${var}
done
```


To see how this for-loop works, let's start with a basic example before executing the actual script:

```
for num in 0 1 2 3 4 5 6 7 8 9; do   
  echo ${num}  ## prints the value stored in 'num'
done
```
The for-loop assigns the values to num as it iterates.


Now, let's move on to the actual script. This time, I use `{0..9}` instead of `0 1 2 3 4 5 6 7 8 9` following `for num in`, which is a  more concise way to list the values to iterate over. 
```
for num in {0..9}; do               

  mkdir result_experimental_${num}
  Rscript script_analysis.r rawdata_experimental_${num}/data_1.csv 1

done
```

Now, copy-and-paste the script above to the terminal and wait for analyses to be done. 



You can also write the command lines above as a script.
```
nano my_first_script.bash
```

```
#!/bin/bash 

for num in {0..9}; do               
    mkdir result_experimental_${num}
    Rscript script_analysis.r "rawdata_experimental_${num}/data_1.csv" 1
done
```

this can be run with the command below.
```
bash my_first_script.bash
```
