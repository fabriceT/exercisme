NF == 1 {
    count = 0
    i = $1
    while (i > 1) {
        if (i % 2 == 0) {
            i = i / 2
        } else {
            i = 3 * i + 1
        }
        count++
    }

    print count
 }
