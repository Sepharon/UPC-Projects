# -*- encoding:utf-8 -*-

import matplotlib.pyplot as plt
from dataset import Dataset


class DataSetPlot (object):
	"""
	La classe *dsplot* serà l'encarregat d'imprimir la gràfica a pantalla, desde l'informació rebuda desde el *dataset*
	Degut a que aquesta classe representa la gràfica no em sapigut fer doctest
	"""
	def __init__(self):
		"""
		Inicialitza un objecte de la classe. En essència la inicialitzacio s’encarrega de definir tota la grafica excepcio feta de les dades a visualitzar.
		"""
		self.fig = plt.figure()
		self.p = plt.plot([], [])
		self._a = []
	
		self.x=plt.xlabel('Temps')
		self.y=plt.ylabel('Temperatura')
	        plt.title("Grafica dades dels sensors")
		plt.grid(True)

	def plot(self,d):
		"""
		Afegeix a la gràfica un conjunt de dades determinat per DataSet d. Si s’afegeix més d’un DataSet es representa cadascun d’un color diferent. L’etiqueta de la llegenda corresponent a aquest *DataSet* es el nom del mateix.
		"""
		self._a.append(d._name)
	
		self.p=plt.plot(d.time_vector(), d.value_vector())
		self.l=plt.legend(self._a)
		
		
	def show(self):
		"""
		Mostra la grafica per la pantalla. El metode no retorna fins que l’usuari tanca la finestra de la grafica.
		"""

		plt.show()




