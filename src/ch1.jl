using LinearAlgebra

using Statistics

using DataFrames


function prob1(DATE::Dates.DateTime, FILE::AbstractString)
    f = open("./result/$FILE", "w")
    

    # 0から1まで0.1刻みのシーケンスを作成
    numbers_range = 0:0.1:1.0

    # シーケンスを通常の配列に変換
    numbers_array = collect(numbers_range)
    println(f, "生成された配列: ", numbers_array)

    # 合計を計算
    total = sum(numbers_array)
    println(f, "合計: ", total)

    # 1から1000までのベクトルを作成
    a = 1:1000

    # 偶数番目の成分を抽出（2番目から2つ飛ばしで最後まで）
    even_elements = a[2:2:end]

    # 抽出したベクトルの30番目の要素を取得
    thirtieth_element = even_elements[30]
    println(f, "30番目の要素: ", thirtieth_element)

    # データをベクトルとして定義
    data = [128, 129, 130, 131, 132]

    # 不偏分散を計算
    unbiased_variance = var(data)
    println(f, "不偏分散: ", unbiased_variance)

    # 行列を定義
    X = [1 1; 1 0]

    # 転置行列との積を計算 (X' は Xの転置)
    XTX = X' * X
    println(f, "X'X = \n", XTX)

    # 行列式を計算
    determinant = det(XTX)
    println(f, "det(X'X) = ", determinant)

    # データフレームを作成
    df = DataFrame(
        年齢階級 = [35, 45, 55, 65, 75],
        血圧 = [114, 124, 143, 158, 166]
    )
    println(f, "作成したデータフレーム:")
    println(f, df)

    # 各列をベクトルとして取り出す
    age_class = df.年齢階級
    blood_pressure = df.血圧

    # 相関係数を計算
    correlation = cor(age_class, blood_pressure)
    println(f, "\n年齢階級と血圧の相関係数: ", correlation)

    # df は問題1-7で作成したものを使用
    df2 = copy(df) # 元のdfを変更しないようにコピー
    df2[!, :壱] = 1

    # 列の順序を整える
    df2 = select(df2, :壱, :年齢階級, :血圧)
    println(f, "① 列を追加したデータフレーム df2:")
    println(f, df2)

    # 2. df2の左2列を取り出して新しいデータフレームを作成
    X_df = select(df2, :壱, :年齢階級)
    println(f, "\n② 抽出したデータフレーム X_df:")
    println(f, X_df)

    # 3. データフレームを行列に変換し、det(X'X) を計算
    X_matrix = Matrix(X_df)
    determinant = det(X_matrix' * X_matrix)
    println(f, "\n③ det(X'X) の計算結果: ", determinant)

    
    close(f)
end