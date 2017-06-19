/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clasifiacionnotas;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import weka.classifiers.Classifier;
import weka.classifiers.trees.DecisionStump;
import weka.core.Instances;

/**
 *
 * @author Alumnos
 */
public class ClasifiacionNotas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException, Exception {
        // TODO code application logic here
        Classifier miClasificador = new DecisionStump();

        Instances entrenamiento = new Instances(new BufferedReader(new FileReader("E:\\R\\weka_7\\Notas.arff")));
        int lastIndex = entrenamiento.numAttributes() - 1;
        entrenamiento.setClassIndex(lastIndex);

        Instances test = new Instances(new BufferedReader(new FileReader("E:\\R\\weka_7\\Notastest.arff")));
        test.setClassIndex(lastIndex);

        miClasificador.buildClassifier(entrenamiento);
        for (int i = 0; i < test.numInstances(); i++) {
            double index = miClasificador.classifyInstance(test.instance(i));
            String className = entrenamiento.attribute(lastIndex).value((int) index);
            System.out.println(className);

        }

    }

}
