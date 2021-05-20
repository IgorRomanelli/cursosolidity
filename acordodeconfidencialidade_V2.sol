// SPDX-License-Identifier: CC-BY-4.0
pragma solidity 0.8.4;

contract AcordoDeConfidencialidade {
    string public parteReveladora;
    string public parteReceptora;
    string definicaoDeInformacaoConfidencial;
    string obrigacoesDaParteReceptora;
    string public excecaoDaObrigacaoDeConfidencialidade;
    string constant inadimplemento;
    uint public vigencia;
    
    constructor () {
        parteReveladora = "Igor";
        parteReceptora = "Nelson";
        definicaoDeInformacaoConfidencial = "Qualquer tipo de informacao disponibilizada pela parte reveladora, seja por meio oral, escrito, magnetico entre outros";
        obrigacoesDaParteReceptora = "Nao divulgar qualquer seja a hipotese qualquer informacao";
        excecaoDaObrigacaoDeConfidencialidade = "Informacao solicitada por determinacao judicial";
        inadimplemento = "Descumprimento da obrigacao de confidencialidade";
        vigencia = 1;
    }
  
    function obtemDefinicaoDeInformacaoConfidencial() public view returns (string memory) {
        return definicaoDeInformacaoConfidencial;
    }
    function definirNovoPrazoParaVigencia(uint novoPrazoParaVigencia) public {
        vigencia = novoPrazoParaVigencia;
    }
    
    function verificarSeHouveInadimplemento(string informacaoRevelada)
    public
    pure
    returns (bool respota) {
        if (informacaoRevelada = excecaoDaObrigacaoDeConfidencialidade) {
            return false;
        } else {
            return true;
        }
    }

}
