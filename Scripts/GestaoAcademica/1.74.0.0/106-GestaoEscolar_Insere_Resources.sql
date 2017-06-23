USE [GestaoPedagogica]
GO

BEGIN TRANSACTION 
SET XACT_ABORT ON   

	/***************
		Copiar do exemplo abaixo.
	****************

        -- Insere resources. 
        EXEC MS_InsereResource 
            @rcr_chave = 'Relatorios.UCRelatorios.lblMessageLayout.MsgAviso' 
            , @rcr_NomeResource = 'WebControls'
            , @rcr_cultura = 'pt-BR'
            , @rcr_codigo = 0 
            , @rcr_valorPadrao = 'A visualiza��o do texto na tela abaixo n�o corresponde, necessariamente, ao formato no qual ele ser� impresso. Este formato segue as normas estabelecidas pela Secretaria Municipal de Educa��o.'

	*/

	EXEC MS_InsereResource 
        @rcr_chave = 'UCDadosBoletim.lblAEETitulo.Text' 
        , @rcr_NomeResource = 'UserControl'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Atendimento educacional especializado'

	EXEC MS_InsereResource 
        @rcr_chave = 'UCAlunoEfetivacaoObservacaoGeral.lblParecerFinalAEE.Text' 
        , @rcr_NomeResource = 'UserControl'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Parecer Final'

	EXEC MS_InsereResource 
        @rcr_chave = 'UCAlunoEfetivacaoObservacaoGeral.lblPorcentagemFreqAEE.Text' 
        , @rcr_NomeResource = 'UserControl'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = '% Freq.'

	EXEC MS_InsereResource 
        @rcr_chave = 'ControleTurma.Alunos.btnRelatorioRP.ToolTip' 
        , @rcr_NomeResource = 'Academico'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Anota��es da recupera��o paralela'
		
	EXEC MS_InsereResource 
        @rcr_chave = 'CLS_RelatorioAtendimentoBO.CLS_RelatorioAtendimentoTipo.AEE' 
        , @rcr_NomeResource = 'Enumerador'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'AEE'

	EXEC MS_InsereResource 
			@rcr_chave = 'CLS_RelatorioAtendimentoBO.CLS_RelatorioAtendimentoTipo.NAAPA' 
			, @rcr_NomeResource = 'Enumerador'
			, @rcr_cultura = 'pt-BR'
			, @rcr_codigo = 0 
			, @rcr_valorPadrao = 'NAAPA'

	EXEC MS_InsereResource 
			@rcr_chave = 'CLS_RelatorioAtendimentoBO.CLS_RelatorioAtendimentoTipo.RP' 
			, @rcr_NomeResource = 'Enumerador'
			, @rcr_cultura = 'pt-BR'
			, @rcr_codigo = 0 
			, @rcr_valorPadrao = 'Recupera��o paralela'

	EXEC MS_InsereResource 
			@rcr_chave = 'CLS_RelatorioPreenchimentoAlunoTurmaDisciplinaBO.RelatorioPreenchimentoAlunoSituacao.Rascunho' 
			, @rcr_NomeResource = 'Enumerador'
			, @rcr_cultura = 'pt-BR'
			, @rcr_codigo = 0 
			, @rcr_valorPadrao = 'Rascunho'

	EXEC MS_InsereResource 
			@rcr_chave = 'CLS_RelatorioPreenchimentoAlunoTurmaDisciplinaBO.RelatorioPreenchimentoAlunoSituacao.Finalizado' 
			, @rcr_NomeResource = 'Enumerador'
			, @rcr_cultura = 'pt-BR'
			, @rcr_codigo = 0 
			, @rcr_valorPadrao = 'Finalizado'

	EXEC MS_InsereResource 
			@rcr_chave = 'CLS_RelatorioPreenchimentoAlunoTurmaDisciplinaBO.RelatorioPreenchimentoAlunoSituacao.Aprovado' 
			, @rcr_NomeResource = 'Enumerador'
			, @rcr_cultura = 'pt-BR'
			, @rcr_codigo = 0 
			, @rcr_valorPadrao = 'Aprovado'

	EXEC MS_InsereResource 
        @rcr_chave = 'ControleTurma.Alunos.btnRelatorioAEE.ToolTip' 
        , @rcr_NomeResource = 'Academico'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Relat�rios do AEE'

	EXEC MS_InsereResource 
        @rcr_chave = 'TUR_TurmaHorarioBO.SalvarTurmaHorario.ValidacaoTemposAula' 
        , @rcr_NomeResource = 'BLL'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'O componente curricular {0} ultrapassou a carga hor�ria ({1}) na turma {2} em {3} aulas.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.lblLegend.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Relat�rio de atendimento'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.lblTitulo.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'T�tulo *'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.rfvTitulo.ErrorMessage' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'T�tulo do relat�rio � obrigat�rio.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.lblPeriodicidade.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Periodicidade *'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.ddlPeriodicidade.msgSelecione' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = '-- Selecione uma peridiocidade --'

	EXEC MS_InsereResource 
        @rcr_chave = 'CLS_RelatorioAtendimentoBO.CLS_RelatorioAtendimentoPeriodicidade.Periodico' 
        , @rcr_NomeResource = 'Enumerador'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Peri�dico'

	EXEC MS_InsereResource 
        @rcr_chave = 'CLS_RelatorioAtendimentoBO.CLS_RelatorioAtendimentoPeriodicidade.Encerramento' 
        , @rcr_NomeResource = 'Enumerador'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Encerramento'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.cpvPeriodicidade.ErrorMessag' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Peridiocidade do relat�rio � obrigat�ria.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.lblTipo.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Tipo de relat�rio *'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.ddlTipo.msgSelecione' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = '-- Selecione um tipo --'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.cpvTipo.ErrorMessage' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Tipo de relat�rio � obrigat�rio.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.chkExibeRacaCor.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permite editar ra�a/cor'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.chkExibeHipotese.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permite editar hip�tese diagn�stica'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.lblTituloAnexo.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'T�tulo do anexo'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.lblAnexo.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Anexo'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.fupAnexo.ToolTip' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Arquivo anexo do relat�rio.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.lblLegendQuestionario.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Question�rio'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.btnAdicionarQuestionario.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Adicionar'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.btnCacelarQuestionario.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Cancelar'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvQuestionario.EmptyDataText' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Nenhum question�rio ligado ao relat�rio de atendimento.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvQuestionario.HeaderTitulo' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'T�tulo'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvQuestionario.HeaderOrdem' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Ordem'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.grvQuestoes.HeaderExcluir' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Excluir'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvQuestionario.btnExcluir.ToolTip' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Excluir question�rio do relat�rio.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.lblLegendGrupo.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Grupo de acesso'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvGrupo.EmptyDataText' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Nenhum grupo de acesso ligado ao relat�rio.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvGrupo.HeaderNome' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Nome'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvGrupo.HeaderPermissaoConsulta' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permiss�o de consulta'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvGrupo.HeaderPermissaoEdicao' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permiss�o de edi��o'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvGrupo.HeaderPermissaoExclusao' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permiss�o de exclus�o'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvGrupo.HeaderPermissaoAprovacao' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permiss�o de aprova��o'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.lblLegendCargo.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Cargo'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvCargo.EmptyDataText' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Nenhum cargo relacionado ao relat�rio.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvCargo.HeaderDescricao' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Descri��o'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvCargo.HeaderPermissaoConsulta' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permiss�o de consulta'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvCargo.HeaderPermissaoEdicao' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permiss�o de edi��o'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvCargo.HeaderPermissaoExclusao' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permiss�o de exclus�o'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.gvCargo.HeaderPermissaoAprovacao' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Permiss�o de aprova��o'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.ckbBloqueado.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Bloqueado'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.bntSalvar.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Salvar'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.btnCancelar.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Cancelar'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.ErroCarregarRelatorio' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Erro ao carregar relat�rio de atendimento.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.TituloAnexoSemArquivo' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'T�tulo do anexo � obrigat�rio se adicionar um arquivo.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.RelatorioIncluidoSucesso' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Relat�rio de atendimento incu�do com sucesso.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.RelatorioAlteradoSucesso' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Relat�rio de atendimento alterado com sucesso.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.ErroSalvarRelatorio' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Erro ao tentar salvar o relat�rio de atendimento.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.btnVoltar.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Voltar'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.ErroCarregarSistema' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Erro ao tentar carregar o sistema.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.QuestionarioObrigatorio' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Question�rio � obrigat�rio.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.ErroAdicionarQuestionario' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Erro ao tentar adicionar o question�rio.'

	EXEC MS_InsereResource 
        @rcr_chave = 'RelatorioAtendimento.Cadastro.btnNovoQuestionario.Text' 
        , @rcr_NomeResource = 'Configuracao'
        , @rcr_cultura = 'pt-BR'
        , @rcr_codigo = 0 
        , @rcr_valorPadrao = 'Adicionar question�rio'

-- Fechar transa��o     
SET XACT_ABORT OFF 
COMMIT TRANSACTION



