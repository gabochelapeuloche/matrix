// Fonction exponentielle

func exponentielle (x: Int, y: Int) -> Int {
    var expXY : Int = 1
    if y == 0 {
        expXY = 1
    } else {
        for i in 0 ... y - 1 {
            expXY = expXY * x
        }
    }
    return expXY
}

/*exponentielle(x: -3, y: 3)
exponentielle(x: -1, y: 4)
exponentielle(x: -1, y: 0)
exponentielle(x: -1, y: 1)*/

// Finction qui crée une matrice composée de nombres aléatoires de taille (n,p)
    
func matrice (n: Int, p: Int) -> [[Int]] {
    
    var matriceEmpty : [[Int]] = [[]]
    
    if n <= 1 && p <= 1 {
        return [[Int.random(in: 0 ... 9)]]
    } else if n < 0 || p < 0 {
        print ("changer le nombre de ligne et de colonnes")
        return [[]]
    } else if n == 1 && p > 1 {
        for i in 0 ... p - 1 {
                matriceEmpty[0].append(Int.random(in: 0 ... 9))
        }
    } else if p == 1 && n > 1 { 
        for i in 0 ... n - 2 {
            matriceEmpty.append([])
        }
        for i in 0 ... n - 1 {
            matriceEmpty[i].append(Int.random(in: 0 ... 9))
        }
    } else {
        for i in 0 ... n - 2 {
            matriceEmpty.append([])
        }
        for i in 0 ... n - 1 {
            for j in 0 ... p - 1 {
                matriceEmpty[i].append(Int.random(in: 0 ... 9))
            }
        }
    }
    
    return matriceEmpty
}

/*matrice (n: 1, p: 5)
matrice (n: 5, p: 6)*/

// Fonction qui crée une matrice carrée de rang rank

func matriceCarrée (rank : Int) -> [[Int]] {
    
    return matrice(n: rank, p: rank)
    
}

/*matriceCarrée(rank: 5)
matriceCarrée(rank: 1)*/

// Fonction qui retourne une matrice indentitée de rang rank

func identityGen (rank : Int) -> [[Int]] {
    var idM : [[Int]] = matriceCarrée(rank: rank)
    for i in 0 ... rank - 1 {
        for j in 0 ... rank - 1 {
            if i == j {
                idM[i][j] = 1
            } else {
                idM[i][j] = 0
            }
        }
    }
    return idM
}

/*identityGen(rank: 3)
identityGen(rank: 4)
identityGen(rank: 6)*/

// Produit scalaire

func produitScalaire (k: Int, m: [[Int]]) -> [[Int]] {
    
    var matriceScalaire : [[Int]] = m
    
    for i in 0 ... m.count - 1 {
        for j in 0 ... m[i].count - 1 {
            matriceScalaire[i][j] = k * matriceScalaire[i][j]
        }
    }
    
    return matriceScalaire
}

/*produitScalaire(k: 3, m: matrice(n: 1, p: 4))
produitScalaire(k: 2, m: matriceCarrée(rank: 5))*/

// Transposée

func matriceTransposée (m: [[Int]]) -> [[Int]] {
    
    var transposée : [[Int]] = m
    var t : Int = 0
    
    if m.count == m[0].count {
        for i in 0 ... m.count - 1 {
            for j in 0 ... m[i].count - 1 {
                if i > j {
                    t = transposée[i][j]
                    transposée[i][j] = transposée[j][i]
                    transposée[j][i] = t
                }
            }
        }
    } else if m.count > m[0].count {
        transposée = []
        for i in 0 ... m[0].count - 1 {
            transposée.append([])
        }
        for i in 0 ... m.count - 1 {
            for j in 0 ... m[0].count - 1 {
                transposée[j].append(m[i][j])
            }
        }
    } else {
        transposée = []
        for i in 0 ... m[0].count - 1 {
            transposée.append([])
        }
        for i in 0 ... m[0].count - 1 {
            for j in 0 ... m.count - 1 {
                transposée[i].append(m[j][i])
            }
        }
    }
    
    return transposée
} 


/*matriceTransposée(m: matrice(n: 4, p: 3))
matriceTransposée(m: matriceCarrée(rank: 4))
matriceTransposée(m: matrice(n: 3, p: 5))*/

// Func Comatrice

func comatrice(m:[[Int]], n: Int, p: Int) -> ([[Int]]) {
    
    var comatrice : [[Int]] = []
    var rang : Int = m.count
    var max : Int = m.count - 1
    
    if rang > 2 {
        for i in 0 ... m.count - 1 {
            comatrice.append([])
        }
        if 0 < n && n < max && 0 < p && p < max {
            
            for i in 0 ... n - 1 {
                for j in 0 ... p - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
            for i in 0 ... n - 1 {
                for j in p + 1 ... m.count - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
            for i in n + 1 ... m.count - 1 {
                for j in 0 ... p - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
            for i in n + 1 ... m.count - 1 {
                for j in p + 1 ... m.count - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
        } else if n == 0 && p > 0 && p < m.count - 1{
            for i in n + 1 ... m.count - 1 {
                for j in 0 ... p - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
            for i in n + 1 ... m.count - 1 {
                for j in p + 1 ... m.count - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
        } else if p == 0 && n > 0 && n < m.count - 1 {
            for i in 0 ... n - 1 {
                for j in p + 1 ... m.count - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
            for i in n + 1 ... m.count - 1 {
                for j in p + 1 ... m.count - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
        } else if n == m.count - 1 && p < m.count - 1 && p > 0 {
            for i in 0 ... n - 1 {
                for j in 0 ... p - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
            for i in 0 ... n - 1 {
                for j in p + 1 ... m.count - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
        } else if n > 0 && n < m.count - 1 && p == m.count - 1 {
            for i in 0 ... n - 1 {
                for j in 0 ... p - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
            for i in n + 1 ... m.count - 1 {
                for j in 0 ... p - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
        } else if n == 0 && p == m.count - 1 { 
            for i in n + 1 ... m.count - 1 {
                for j in 0 ... p - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
        } else if n == m.count - 1 && p == 0 {
            for i in 0 ... n - 1 {
                for j in p + 1 ... m.count - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
        } else if n == 0 && p == 0 {
            for i in n + 1 ... m.count - 1 {
                for j in p + 1 ... m.count - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
        } else if n == m.count - 1 && p == m.count - 1 {
            for i in 0 ... n - 1 {
                for j in 0 ... p - 1 {
                    comatrice[i].append(m[i][j])
                }
            }
        }
        comatrice.remove(at: n)
    }
    return comatrice
}

/*comatrice(m: matriceCarrée(rank: 5), n:0, p: 3)
comatrice(m: matriceCarrée(rank: 5), n:4, p: 4)
comatrice(m: matriceCarrée(rank: 5), n:0, p: 4)
comatrice(m: matriceCarrée(rank: 5), n:4, p: 0)
comatrice(m: matriceCarrée(rank: 4), n:0, p: 0)
comatrice(m: matriceCarrée(rank: 5), n:3, p: 0)
comatrice(m: matriceCarrée(rank: 5), n:4, p: 3)
comatrice(m: matriceCarrée(rank: 4), n:3, p: 3)
comatrice(m: matriceCarrée(rank: 4), n:2, p: 2)
comatrice(m: matriceCarrée(rank: 4), n:2, p: 3)*/


// Déterminant

func déterminantCarréScnd (m: [[Int]]) -> Int {
    var rang = m.count
    var detCarreSecnd : Int = 0
    
    
    if rang == 2 {
        detCarreSecnd = m[0][0] * m[1][1] - m[1][0] * m[0][1]
    } 
    return detCarreSecnd
}

/*déterminantCarréScnd(m: matriceCarrée(rank: 2))
déterminantCarréScnd(m: matriceCarrée(rank: 2))*/


func déterminant (m: [[Int]]) -> (Int, String, [[Int]]) {
    var rang = m.count
    var det : Int = 0
    var detArray : [Int] = []
    
    for i in 0 ... m.count - 1 {
        detArray.append(exponentielle(x: -1, y: i) * m[i][0] * déterminantCarréScnd(m: comatrice(m: m, n: i, p: 0)))
    }
    for element in detArray {
        det += element
    }
    
    return (det, "est le déterminant de", m)
}

/*déterminant(m: matriceCarrée(rank: 3))
déterminant(m: matriceCarrée(rank: 3))*/

//
