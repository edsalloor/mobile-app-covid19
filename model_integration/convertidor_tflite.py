import tensorflow as tf
from keras.models import model_from_json
from keras import optimizers

Alfa =0.0005

# Read the model from JSON file
json_file = open('model_covid19.json', 'r')		# Arquitecture of the model file
loaded_model_json = json_file.read()
json_file.close()
modelo = model_from_json(loaded_model_json)
# Load the model architecture 
modelo.load_weights('weigths_covid19.h5') 		# Weigths of the model file
print('Modelo cargado')
modelo.compile(loss='binary_crossentropy', optimizer=optimizers.Adam(lr=Alfa), metrics=['acc'])
modelo.summary()
# Save the model plus weigths
modelo.save('model_weigths.h5')					# Arquitecture plus weigths file

# Convert hdf5 file to tflite
converter = tf.lite.TFLiteConverter.from_keras_model_file( 'model_weigths.h5' )
model = converter.convert()
file = open( 'result_model.tflite' , 'wb' )		# File coverted to tflite format
file.write( model )