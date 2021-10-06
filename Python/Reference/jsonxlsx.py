import json
import pandas as pd
from json_excel_converter import Converter
from json_excel_converter.xlsx import Writer
import xlsxwriter

data = {}
data['people'] = []
data['people'].append({
    'name': 'Scott',
    'website': 'stackabuse.com',
    'from': 'Nebraska'
})
data['people'].append({
    'name': 'Larry',
    'website': 'google.com',
    'from': 'Michigan'
})
data['people'].append({
    'name': 'Tim',
    'website': 'apple.com',
    'from': 'Alabama'
})
data['cars'] = []
data['cars'].append({
	'motor': '34f',
	'type': 'BMW',
	'year': '1998'
	})
data

with open('data.json', 'w') as outfile:
    json.dump(data, outfile)

with open('data.json') as json_file:
    data = json.load(json_file)
    for p in data['people']:
        print('Name: ' + p['name'])
        print('Website: ' + p['website'])
        print('From: ' + p['from'])
        print('')

#df = pd.read_json('data.json')
#df.to_excel('exported.xls')#, sheet_name='Session1', index=False)

#conv = Converter()
#conv.convert(data.json(), Writer(file='ExcelData.xlsx'))

workbook = xlsxwriter.Workbook('hello.xlsx')
worksheet = workbook.add_worksheet()
worksheet.write('A2', 'Hello world')
workbook.close()
