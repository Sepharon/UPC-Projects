# -*- encoding:utf-8 -*-
from node import *

class triport (object):

	"""

	La clase triport es l'encarregada de treballar amb els nodes i convinar-los

	>>> a= Entrada('node1')
	>>> b= Entrada('node2')
	>>> out= Sortida('sortida')
       	>>> T= triport(a,b,out)	
	>>> super= Supervisor()
	>>> super.add_node(a)
	>>> a.up()
       	>>> super.add_node(b)	
	>>> b.down()
       	>>> super.add_node(out)
	"""
	def __init__(self,i1,i2,o):
		"""
		
		Crea un constructor amb les variables i1,i2 i o 
		"""
		self._i1 = i1
		self._i2 = i2
		self._out = o

	def tick(self):
		"""
		Aquesta funcio compara dos estats utilitzant una porta OR o una porta AND, per fer-ho demana el estat dels nodes i després compara els dos estats utilitzant portes OR o AND
		"""
		estat1=self._i1.ask()
	        estat2=self._i2.ask()

		resultat=self._do_function(estat1,estat2)
		self._out.say(resultat)

	def __repr__(self):
		estat1=self._i1.ask()
	        estat2=self._i2.ask()
		return (("\nEstat 1: " + str(estat1) +"\nEstat 2: " +  str(estat2)+  "\nSortida: " +str(self._out) +  '\n'+"Operació: " + str(self.get_name())))

class And (triport):

	"""
	Aquesta classe es l'encarregada de comparar dos estats emulant una porta AND, si el estat1 i estat2 valen 1, retorna 1
	
	>>> a= Entrada('node1')
	>>> b= Entrada('node2')
	>>> out= Sortida('sortida')
       	>>> T= triport(a,b,out)	
	>>> super= Supervisor()
	>>> super.add_node(a)
	>>> a.up()
       	>>> super.add_node(b)	
	>>> b.down()
       	>>> super.add_node(out)
	>>> operacio=And(a,b,out)
	>>> operacio._do_function(1,1)
	1
	>>> operacio._do_function(0,1)
	0
	"""
	
	def _do_function(self,e1,e2):
		"""
		Funcio encarregada de comparar els dos estats simulant una porta AND
		"""
		return e1&e2

	def get_name(self):
		"""
		Retorna el nom de la porta que s'ha simulat
		"""
		return "And"
		
class Or (triport):
	"""
	La classe Or es l'encarregada d'emular una porta OR utilitzant el metode _do_function

	>>> a= Entrada('node1')
	>>> b= Entrada('node2')
	>>> out= Sortida('sortida')
       	>>> T= triport(a,b,out)	
	>>> super= Supervisor()
	>>> super.add_node(a)
	>>> a.up()
       	>>> super.add_node(b)	
	>>> b.down()
       	>>> super.add_node(out)
	>>> operacio=And(a,b,out)
	>>> operacio._do_function(1,1)
	1
	>>> operacio._do_function(0,1)
	0
	"""
	def _do_function(self,e1,e2):
		"""
		Funcio encarregada de emular una porta OR
		"""
		return e1|e2

	def get_name(self):
		"""
		Retorna el nom de la porta que s'ha simulat
		"""
		return "Or"


