aliyun ecs DescribeInstances --output cols=InstanceId,InstanceName rows=Instances.Instance[] | grep "i-" > temp.txt
sed  's/ //g' temp.txt |sed  's#|#,#g' > temp1.txt
rm -f temp.txt
 for i in `cat temp1.txt`;
do  
a=`echo $i | cut -d',' -f1`
b=`echo $i | cut -d',' -f2`
aliyun ecs CreateImage --InstanceId $a --ImageName $b-Image-`date +"%d-%m-%Y-%H"`
done
