import json

def get_handler(event, context):
    # Implemente o código para a lógica GET aqui
    return {
        'statusCode': 200,
        'body': json.dumps('GET request successful')
    }

def put_handler(event, context):
    # Implemente o código para a lógica PUT aqui
    return {
        'statusCode': 200,
        'body': json.dumps('PUT request successful')
    }

def post_handler(event, context):
    # Implemente o código para a lógica POST aqui
    return {
        'statusCode': 200,
        'body': json.dumps('POST request successful')
    }

def delete_handler(event, context):
    # Implemente o código para a lógica DELETE aqui
    return {
        'statusCode': 200,
        'body': json.dumps('DELETE request successful')
    }