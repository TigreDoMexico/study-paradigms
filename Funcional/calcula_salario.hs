import System.IO
import Text.Printf

calculaMedia :: [Double] -> Double
calculaMedia numeros = sum numeros / fromIntegral (length numeros)

calculaSalarios :: [Double] -> [Double]
calculaSalarios salarios = [ salario * 0.9 | salario <- salarios ]

formatarParaMoeda :: Double -> String
formatarParaMoeda numero = printf "R$ %.2f\n" numero

criarConteudo :: String -> String -> String
criarConteudo salarios media = salarios ++ "Media: " ++ media

processarArquivos :: FilePath -> FilePath -> IO ()
processarArquivos inputPath outputPath = do
    salarios <- fmap (map read . words) $ readFile inputPath

    let salariosCalculados = calculaSalarios salarios
    let media = calculaMedia salarios

    -- let salariosFormatados = [ formatarParaMoeda salario | salario <- salariosCalculados ]
    let salariosFormatados = concatMap formatarParaMoeda salariosCalculados
    let mediaFormatada = formatarParaMoeda media

    writeFile outputPath $ criarConteudo salariosFormatados mediaFormatada

main :: IO ()
main = do
    {-
    putStrLn "Digite o arquivo origem: "
    inputFile <- getLine

    putStrLn "Digite o arquivo destino: "
    outputFile <- getLine
    -}

    let inputFile = "./Files/lista_salarios.txt"
    let outputFile = "./Files/lista_atualizada.txt"
    
    processarArquivos inputFile outputFile
    putStrLn "Media calculada" 