# -*-coding:utf-8-*-

from odbAccess import *
from abaqusConstants import *
import numpy as np

odbname = '20-60.odb'
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
    print("Number of stress values in frame {}:".format(ifm), len(stressdinst.values))
    if len(stressdinst.values) > 0:
        print("First stress value in frame {}:".format(ifm), stressdinst.values[0].data)
    else:
        print("No stress data found in frame {}".format(ifm))
    strainlist = []
    for i in range(6):
        straindata = lastfram.fieldOutputs['SDV{}'.format(i+7)]
        straindinst = straindata.getSubset(region=instance)
        print("Number of strain values in frame {}, SDV{}:".format(ifm, i+7), len(straindinst.values))
        if len(straindinst.values) > 0:
            strainvalue = straindinst.values[nele].data
            strainlist.append(strainvalue)
            print("Strain value at index {}:".format(nele), strainvalue)
        else:
            print("No strain data found for SDV{}".format(i+7))
    if len(stressdinst.values) > 0 and len(strainlist) > 0:
        stresslist = [stress.data for stress in stressdinst.values]
        stressarray = np.array(stresslist)
        strainarray = np.array(strainlist)
        dissip_energy = np.dot(stressarray, strainarray)
        fmenergy.append(dissip_energy)
    else:
        print("Skipping frame {} due to missing data.".format(ifm))
    fmstress.append(stresslist)
    fmstrain.append(strainlist)

print("Energy values:", fmenergy)