LAST_POINT = 10
graph = plot([])
for conf in ((3, 3, 0.05, 0, 'red'), (3, 0.4, 0.05, 0.1, 'blue'), (3, 3, 0.05, 0.1, 'green')):
    (F, A, D, C, color) = conf
    print 'F =', F, ', A =', A, ', D =', D, ', C =',  C, ', color =', color
    if C < D:
        graph += plot((1 - e^(-A * x)) * (1 - D) / A + D * x, (x, 0, F), color=color)
        graph += plot((1 - e^(-A*F)) * (1 - D) / A + D * F, (x, F, LAST_POINT), color=color)
    else:
        print "1/A * log((1 - D) / (C - D)) =", 1/A * log((1 - D) / (C - D)), ", bool(1/A * log((1 - D) / (C - D)) < F) =", bool(1/A * log((1 - D) / (C - D)) < F)
        graph += plot((1 - e^(-A*x)) * (1 - D) / A + D * x, (x, 0, min(F, 1/A*log((1 - D)/(C - D)))), color=color)
        if min(F, 1/A * log((1 - D) / (C - D))) < F:
            graph += plot((1 - C) / A + D / A * log((1 - D) / (C - D)) + C * (x - 1/A * log((1 - D) / (C - D))), (x, min(F, 1/A * log((1 - D) / (C - D))), F), color=color)
        if F > 1/A * log((1 - D) / (C - D)):
            graph += plot((1 - C) / A + D / A * log((1 - D) / (C - D)) + C * (F - 1 / A * log((1 - D) / (C - D))), (x, F, LAST_POINT), color=color)
        else:
            graph += plot((1 - e^(-A * F)) * (1 - D) / A + D * F, (x, F, LAST_POINT), color=color)
graph.show()
