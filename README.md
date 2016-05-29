# DRY Fusion data munging kata
This repository contains a Swift 2.2 implementation of the third part in Dave Thomas' [Data Munging programming exercise](http://codekata.com/kata/kata04-data-munging/). The exercise, known as a _kata_, focuses on extracting information from text files, whose data are arranged in similar but different formats. 

The kata's third challenge is to apply the [DRY principle](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) to two data munging programs written earlier during the kata. I managed to "not repeat myself" by creating the higher-order function seen in [munging.swift](/DryMungingKata/munging.swift), which is similar to a [template method](https://sourcemaking.com/design_patterns/template_method) but does not require subclassing. This function is invoked from [main.swift](/DryMungingKata/main.swift) once for each data file.
