def plot_tsv(src, cols, colors):
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
    color_index = 0
    for col in cols:
        cur_points = []
        index = 0
        for row in rows:
            cur_points.append([index, row[col]])
            index += 1
        g += line(cur_points, color=colors[color_index])
        color_index += 1
    g.show()
