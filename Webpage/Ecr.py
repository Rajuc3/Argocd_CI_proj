import boto3

client = boto3.client('ecr')
repositoryName="flaskapp"
response = client.create_repository(repositoryName=repositoryName)
repositoryUri=response['repository']['repositoryUri']
print(repositoryUri)








#https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ecr/client/create_repository.html