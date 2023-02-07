import boto3
import random
import os

DDB_NAME=os.environ.get("DDB_NAME")
print(DDB_NAME)
ddb=boto3.client('dynamodb',region_name='ap-northeast-2')



#print(ddb.get_item(TableName='test2',Key={"name": {"S":"junghun"},"age":{"S":"50"}}))
while True:
    rand_key=str(random.randint(0, 100000000))
    ddb.put_item(TableName=DDB_NAME, Item={"name": {"S":"1"},"age":{"S":"1"}})

#while True:
#  ddb.get_item(TableName='test2',Key={"name": {"S":"junghun"},"age":{"S":"50"}})
  
