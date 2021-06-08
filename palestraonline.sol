/*
SPDX-License-Identifier: CC-BY-4.0
(c) Desenvolvido por Igor Romanelli
*/

pragma solidity 0.8.4;

contract  PalestraOnline {
    
    struct Participante{
        string nome;
        string sobrenome;
        uint idade;
        address payable enderecoCarteira;
    }
    
    address payable public contaPalestrante;
    uint public prazoFinalDeInscricao;
    uint constant public numeroMaximoDePalestras = 2;
    
    mapping (uint => string) public conteudoDaPalestra;
    
    string[] public participante;
    
    constructor (
        uint _duracaoPalestra,
        address payable _contaPalestrante
    ) {
        conteudoDaPalestra [1] = "Direito Penal";
        conteudoDaPalestra [2] = "Direito Empresarial";
        conteudoDaPalestra [3] = "Direito Civil";
        participante.push("Nenhum");  // 0
        prazoFinalDeInscricao = block.timestamp + _duracaoPalestra;
    }
    
    function incluirParticipante(string memory _nomeDoParticipante, address payable enderecoCarteiraDoParticipante) public {
        participante.push(_nomeDoParticipante);
        
        }
    
    function consultarOrdemDeInscricao (uint _participante) public view returns (string memory) {
        return participante[_participante];
    }
    
    function novaInscricao(string memory _nomeDoParticipante, address payable enderecoCarteiraDoParticipante) public payable {
        require(block.timestamp <= prazoFinalDeInscricao, "Inscricoes Encerradas.");
    }
    
    event fazerNovaInscricao (string Participante);
    
    modifier verificarNumeroDePalestraAssistida {
        require(msg.value <= numeroMaximoDePalestras, "Eh permitido asssistir apenas 2 palestras");
        _;
    }
}
