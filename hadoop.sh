hdfs dfs -ls /
hdfs dfs -mkdir /dsets/census
wget ftp://nas.cs.smu.ca/share/5570/adult.data

# Putting data into the directory
hdfs dfs -put adult.data /dsets/census

# Setting file read/write permission for everyone
hdfs dfs -chmod 777 /dsets/census/adult.data

# Setting folder read/write permission for everyone
hdfs dfs -chmod 777 /dsets

# T2
# New directory
hdfs dfs -mkdir /hw1t2

# Downloading program file
wget ftp://nas.cs.smu.ca/share/5570/WordCount.java


# Putting file into the directory
hdfs dfs -put WordCount.java /hw1t2
hdfs dfs -put words.txt /hw1t2

# Compile
hadoop com.sun.tools.javac.Main WordCount.java
jar cf wc.jar WordCount*.class

# Run jon
hadoop jar wc.jar WordCount input out