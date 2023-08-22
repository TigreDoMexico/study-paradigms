import Data.List
import System.IO
import Text.Read (readMaybe)

data Funcionario = Funcionario String Float
    deriving Show

stringToFloat :: String -> Float
stringToFloat s = case readMaybe s of
   Just x  -> x
   Nothing -> 0.0

obterSalario :: Funcionario -> Float
obterSalario (Funcionario _ salario) = salario

obterNome :: Funcionario -> String
obterNome (Funcionario nome _) = nome

main :: IO ()
main = do
    putStrLn "CADASTRO FUNCIONARIO"

    putStrLn "Digite o nome do funcionario"
    funcionarioNome <- getLine

    putStrLn "Digite o salario do funcionario"
    funcionarioSalario <- getLine
    let salarioNumero = stringToFloat funcionarioSalario

    let funcionario = Funcionario funcionarioNome salarioNumero

    putStrLn $ "Funcionario: " ++ obterNome funcionario
    putStrLn $ "Salario: " ++ show (obterSalario funcionario)