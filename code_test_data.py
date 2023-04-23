import xml.etree.ElementTree as ET

# english data and french data
# Parse the XML file
tree = ET.parse('/Users/vijaychilaka/Downloads/fr-en/IWSLT13.TED.tst2010.fr-en.en.xml')
tree1 = ET.parse('/Users/vijaychilaka/Downloads/fr-en/IWSLT13.TED.tst2010.fr-en.fr.xml')
root = tree.getroot()
root1 = tree1.getroot()

english_text_arrays_test = []
french_text_arrays_test = []

# Access elements and attributes for eng;ish data
for child in root:
    print(child.tag, child.attrib)
    for subchild in child:
        #print(subchild.tag)
        #print(subchild.tag, subchild.attrib)
        for subchild_1 in subchild:
            if subchild_1.tag == 'seg':
                english_text_arrays_test.append(subchild_1.text)
                #print(subchild_1.text)

# Access elements and attributes for french data
for child_f in root1:
    print(child_f.tag, child_f.attrib)
    for subchild_f in child_f:
        #print(subchild_f.tag)
        #print(subchild_f.tag, subchild_f.attrib)
        for subchild_1_f in subchild_f:
            if subchild_1_f.tag == 'seg':
                french_text_arrays_test.append(subchild_1_f.text)

print(english_text_arrays_test[0])
print(french_text_arrays_test[0])
        