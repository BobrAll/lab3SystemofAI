from pyswip import Prolog
import re

prolog = Prolog()
prolog.consult("data.pl")
subjects = []
predicates = ['kill', 'effect', 'plant', 'zombie', 'damage',
              'toughness', 'eat', 'shoot', 'help', 'die', 'balance']


def query_prolog(query):
	try:
		results = list(prolog.query(query))
	except:
		return {'you should enter more entities'}

	if results:
		return {True} if results == [{}] else results
	else:
		return {False}


def sentence_to_prolog(sentence):
	entities = []
	verb = ''

	words = sentence.split(' ')
	for word in words:
		word = re.sub(r'[^\w\s]', '', word)

		if word == 'info' or word == 'list' or word == 'information':
			entities.append('X')

		if word in subjects:
			entities.append(word)
		elif word in predicates:
			verb = word

	prolog_query = ""
	if entities and verb:
		prolog_query = f"{verb}({', '.join(entities)})"

	if verb == '':
		print('You should enter verb')
		return False
	if entities == []:
		print('You should enter entities from list:')
		print(subjects)
		return False

	return prolog_query


for subject in (query_prolog('plant(X).') + query_prolog('zombie(X).')):
	subjects.append(subject['X'])

while True:
	sentence = input('Enter your question >>')
	query = sentence_to_prolog(sentence)

	if query:
		answers = query_prolog(query)
		for answer in answers:
			print('>>', answer)
