#-*-coding:utf-8-*-

from odbAccess import *
from abaqusConstants import *
import math
import os
import numpy as np


odbname = '20-UCP0.odb'
instancename = 'SOLDER-1'
odb = openOdb(odbname)
instance = odb.rootAssembly.instances[instancename]

nele = 337

fmstress = []
fmstrain = []
fmenergy = []

for ifm in range(len(odb.steps['Step-1'].frames)):
    lastfram = odb.steps['Step-1'].frames[ifm]

    stressdata = lastfram.fieldOutputs['S']

    stressdinst = stressdata.getSubset(region=instance)

    stresslist = []
    strainlist = []

    stresslist = stressdinst.values[nele].data
    print(stresslist)


    for i in range(6):
        straindata = lastfram.fieldOutputs['SDV{}'.format(i+7)]
        straindinst = straindata.getSubset(region=instance)
        strainvalue = straindinst.values[nele].data
        strainlist.append(strainvalue)
        print(strainvalue)

    fmstress.append(stresslist)
    fmstrain.append(strainlist)

    stressarray = np.array(stresslist)
    strainarray = np.array(strainlist)

    dissip_energy = np.dot(stressarray, strainarray)
    fmenergy.append(dissip_energy)
print(fmenergy)
