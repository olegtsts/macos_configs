def plot_tsv(src, x_col, y_col):
    number_col = {}
    first_row = True
    rows = []
    with open(src, 'r') as fh:
        for cur_line in fh:
            if first_row:
                number = 0
                for name in cur_line.rstrip().split('\t'):
                    number_col[number] = name
                    number += 1
            else:
                row = {}
                number = 0
                for value in cur_line.rstrip().split('\t'):
                    row[number_col[number]] = value
                    number += 1
                rows.append(row)
            first_row = False
    print len(rows)
    g = Graphics()
    cur_points = []
    for row in rows:
        cur_points.append([float(row[x_col]), float(row[y_col])])
    g += line(cur_points, color='blue')
    g.show()
    g.save("file1.png")
