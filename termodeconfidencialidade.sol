 
//SPDX-License-Identifier: MIT
//Author: Igor Ribeiro Romanelli
pragma solidity 0.8.6;

contract TermoDeConfidencialidade {
    
    struct DefinicaoDeInformacaoConfidencial {
        string informacaoDefinidaComoConfidencial;
    }
    
    struct Partes {
        string parteReceptora;
        uint cpfParteReceptora;
        string parteReveladora;
        uint cpfParteReveladora;
            }

    address public fiscalDoContrato;
    Partes [] public ConsultaPartes;
    DefinicaoDeInformacaoConfidencial [] public InformacaoConfidencial;
    
    mapping (uint => string) public ExcecaoDeInformacaoConfidencial;
    
    constructor (
        
        ) {
        fiscalDoContrato = msg.sender;
        ExcecaoDeInformacaoConfidencial [1] = "Informacao De Dominio Publico";
        ExcecaoDeInformacaoConfidencial [2] = "Informacao Desenvolvidada de forma independente pela Receptora";
        ExcecaoDeInformacaoConfidencial [3] = "Informacoes previamente conhecidas pela Parte Receptora";
        ExcecaoDeInformacaoConfidencial [3] = "Informacoes recebidas por terceiros sem vinculo de confidencialidade";

    }
    
    function RegistrarPartes(
        string memory novaParteReceptora,
        uint  novoCpfParteReceptora,
        string memory novaParteReveladora,
        uint novoCpfParteReveladora
        )
        external returns (bool) {
        require(msg.sender == fiscalDoContrato, "Apenas o Fiscal do Contrato pode cadastrar as Partes");
        Partes memory novoCadastroDePartes = Partes(novaParteReceptora, novoCpfParteReceptora, novaParteReveladora, novoCpfParteReveladora);
        ConsultaPartes.push(novoCadastroDePartes);
        return true;
    }
    
    function RegistrarNovaInformacaoComoConfidencial(
        string memory novainformacaoDefinidaComoConfidencial
        )
        external returns (bool) {
        require(msg.sender == fiscalDoContrato, "Apenas o Fiscal pode definir novas informacoes como confidencial");    
        DefinicaoDeInformacaoConfidencial memory novaInformacaoComoConfidencial = DefinicaoDeInformacaoConfidencial(novainformacaoDefinidaComoConfidencial);
        InformacaoConfidencial.push(novaInformacaoComoConfidencial);
        return true;
            
        }

}    
