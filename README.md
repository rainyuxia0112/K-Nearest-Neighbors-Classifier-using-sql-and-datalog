# Introduction to how to run Rasql

## Get Started

- Preparation before runnning

* This duty needs to be done in Rasql 

* Needs to activate a new enviroment

```shell
source ./bin/activate   # or use. ./bin/activate
```

- run the script
```shell
cd release
./rasql-run.sh
```

* Note: we need to put all sql script into **release/query/rasql**; chnage the **test_rasql.txt** to our own txt

### introduction to files

- KNN -  all recursive and non-recursive script we use, including **knn_nonrecusive.deal**, **knn_recusive.deal**, **recusive.sql**, **non_recusive.sql**, **the demo of the result**, **datapreprocessing script** and the  **test dataset**

- NBC - includes all recursive script we use


### output

- **test_out.csv**


# Introduction to how to run Datalog

## Get Started

- Preparation before runnning

* This duty needs to be done in deal 

* Needs to build a new enviroment and put **.fac** and **.deal** file in datalog

