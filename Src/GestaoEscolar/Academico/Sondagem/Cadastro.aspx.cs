﻿using System;
using System.Linq;
using MSTech.GestaoEscolar.Web.WebProject;
using MSTech.GestaoEscolar.Entities;
using MSTech.GestaoEscolar.BLL;
using MSTech.CoreSSO.BLL;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using MSTech.Validation.Exceptions;
using System.Web.UI;
using System.Collections.Generic;

namespace GestaoEscolar.Academico.Sondagem
{
    public partial class Cadastro : MotherPageLogado
    {
        #region Propriedades

        /// <summary>
        /// Propriedade em ViewState que armazena a lista de questões
        /// </summary>
        private List<ACA_SondagemQuestao> VS_ListaQuestao
        {
            get
            {
                if (ViewState["VS_ListaQuestao"] == null)
                    ViewState["VS_ListaQuestao"] = new List<ACA_SondagemQuestao>();
                return (List<ACA_SondagemQuestao>)ViewState["VS_ListaQuestao"];
            }
            set
            {
                ViewState["VS_ListaQuestao"] = value;
            }
        }

        /// <summary>
        /// Propriedade em ViewState que armazena a lista de sub-questões
        /// </summary>
        private List<ACA_SondagemQuestao> VS_ListaSubQuestao
        {
            get
            {
                if (ViewState["VS_ListaSubQuestao"] == null)
                    ViewState["VS_ListaSubQuestao"] = new List<ACA_SondagemQuestao>();
                return (List<ACA_SondagemQuestao>)ViewState["VS_ListaSubQuestao"];
            }
            set
            {
                ViewState["VS_ListaSubQuestao"] = value;
            }
        }

        /// <summary>
        /// Propriedade em ViewState que armazena a lista de respostas
        /// </summary>
        private List<ACA_SondagemResposta> VS_ListaResposta
        {
            get
            {
                if (ViewState["VS_ListaResposta"] == null)
                    ViewState["VS_ListaResposta"] = new List<ACA_SondagemResposta>();
                return (List<ACA_SondagemResposta>)ViewState["VS_ListaResposta"];
            }
            set
            {
                ViewState["VS_ListaResposta"] = value;
            }
        }

        /// <summary>
        /// Retorna o valor do parâmetro "Permanecer na tela após gravações"
        /// </summary>
        private bool ParametroPermanecerTela
        {
            get
            {
                return ACA_ParametroAcademicoBO.ParametroValorBooleanoPorEntidade(eChaveAcademico.BOTAO_SALVAR_PERMANECE_TELA, __SessionWEB.__UsuarioWEB.Usuario.ent_id);
            }
        }
        
        /// <summary>
        /// Propriedade em ViewState que informa se pode editar a sondagem (se já estiver em uso ou com agendamento vigente)
        /// </summary>
        private bool VS_permiteEditar
        {
            get
            {
                if (ViewState["VS_permiteEditar"] != null)
                {
                    return Convert.ToBoolean(ViewState["VS_permiteEditar"]);
                }
                return true;
            }
            set
            {
                ViewState["VS_permiteEditar"] = value;
            }
        }

        /// <summary>
        /// Propriedade em ViewState que armazena valor de snd_id
        /// no caso de atualização de um registro ja existente.
        /// </summary>
        private int VS_snd_id
        {
            get
            {
                if (ViewState["VS_snd_id"] != null)
                {
                    return Convert.ToInt32(ViewState["VS_snd_id"]);
                }
                return -1;
            }
            set
            {
                ViewState["VS_snd_id"] = value;
            }
        }

        /// <summary>
        /// Propriedade em ViewState que armazena valor de sdq_id
        /// no caso de atualização de um registro ja existente.
        /// </summary>
        private int VS_sdq_id
        {
            get
            {
                if (ViewState["VS_sdq_id"] != null)
                {
                    return Convert.ToInt32(ViewState["VS_sdq_id"]);
                }
                return -1;
            }
            set
            {
                ViewState["VS_sdq_id"] = value;
            }
        }

        /// <summary>
        /// Propriedade em ViewState que armazena valor de sdr_id
        /// no caso de atualização de um registro ja existente.
        /// </summary>
        private int VS_sdr_id
        {
            get
            {
                if (ViewState["VS_sdr_id"] != null)
                {
                    return Convert.ToInt32(ViewState["VS_sdr_id"]);
                }
                return -1;
            }
            set
            {
                ViewState["VS_sdr_id"] = value;
            }
        }

        /// <summary>
        /// Propriedade em ViewState que armazena valor do tipo de campo que vai inserir
        /// </summary>
        private byte VS_tipo
        {
            get
            {
                if (ViewState["VS_tipo"] != null)
                {
                    return Convert.ToByte(ViewState["VS_tipo"]);
                }
                return 0;
            }
            set
            {
                ViewState["VS_tipo"] = value;
            }
        }

        /// <summary>
        /// Propriedade em ViewState que armazena texto do tipo de campo que vai inserir
        /// </summary>
        private string VS_tipoText
        {
            get
            {
                if (ViewState["VS_tipoText"] != null)
                {
                    return ViewState["VS_tipoText"].ToString();
                }
                return "";
            }
            set
            {
                ViewState["VS_tipoText"] = value;
            }
        }

        #endregion

        #region Métodos

        /// <summary>
        /// Carrega dados da sondagem
        /// </summary>
        /// <param name="snd_id">ID da sondagem</param>
        private void _LoadFromEntity(int snd_id)
        {
            try
            {
                ACA_Sondagem snd = new ACA_Sondagem { snd_id = snd_id };
                ACA_SondagemBO.GetEntity(snd);

                VS_snd_id = snd.snd_id;

                txtTitulo.Text = snd.snd_titulo;
                txtTitulo.Enabled = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar;

                txtDescricao.Text = snd.snd_descricao;
                txtDescricao.Enabled = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar;

                ckbBloqueado.Checked = !snd.snd_situacao.Equals(1);
                ckbBloqueado.Enabled = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar;
                ckbBloqueado.Visible = true;

                //TODO: verificar se tem dados lançados
                List<ACA_SondagemAgendamento> lstAgendamentos = ACA_SondagemAgendamentoBO.SelectAgendamentosBy_Sondagem(snd_id);
                VS_permiteEditar = !lstAgendamentos.Any(a => a.sda_dataFim >= DateTime.Today && a.sda_dataInicio <= DateTime.Today &&
                                                             a.sda_situacao != (byte)ACA_SondagemAgendamentoSituacao.Cancelado);

                List<ACA_SondagemQuestao> lstAux = ACA_SondagemQuestaoBO.SelectQuestoesBy_Sondagem(snd_id);

                VS_ListaQuestao = lstAux.Where(q => q.sdq_subQuestao == false).ToList();

                VS_ListaSubQuestao = lstAux.Where(q => q.sdq_subQuestao == true).ToList();

                VS_ListaResposta = ACA_SondagemRespostaBO.SelectRespostasBy_Sondagem(snd_id);

                VS_ListaQuestao = VS_ListaQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                grvQuestoes.DataSource = VS_ListaQuestao;
                grvQuestoes.DataBind();

                if (grvQuestoes.Rows.Count > 0)
                {
                    ((ImageButton)grvQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                    ((ImageButton)grvQuestoes.Rows[grvQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                }

                VS_ListaSubQuestao = VS_ListaSubQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                grvSubQuestoes.DataSource = VS_ListaSubQuestao;
                grvSubQuestoes.DataBind();

                if (grvSubQuestoes.Rows.Count > 0)
                {
                    ((ImageButton)grvSubQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                    ((ImageButton)grvSubQuestoes.Rows[grvSubQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                }

                VS_ListaResposta = VS_ListaResposta.OrderBy(r => r.sdr_ordem).ThenBy(r => r.sdr_sigla).ThenBy(r => r.sdr_descricao).ToList();

                grvRespostas.DataSource = VS_ListaResposta;
                grvRespostas.DataBind();

                if (grvRespostas.Rows.Count > 0)
                {
                    ((ImageButton)grvRespostas.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                    ((ImageButton)grvRespostas.Rows[grvRespostas.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                }

                btnAdicionarQuestao.Visible = btnAdicionarResposta.Visible = btnAdicionarSubQuestao.Visible = VS_permiteEditar;
            }
            catch (Exception ex)
            {
                ApplicationWEB._GravaErro(ex);
                lblMessage.Text = UtilBO.GetErroMessage(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.ErroCarregarSondagem").ToString(), UtilBO.TipoMensagem.Erro);
            }
        }

        /// <summary>
        /// Insere ou altera a sondagem
        /// </summary>
        private void Salvar()
        {
            try
            {
                if (!VS_ListaResposta.Any(r => r.sdr_situacao != (byte)ACA_SondagemRespostaSituacao.Excluido))
                    throw new ValidationException(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.RespostaObrigatoria").ToString());

                ACA_Sondagem snd = new ACA_Sondagem
                {
                    snd_id = VS_snd_id
                    ,
                    snd_titulo = txtTitulo.Text
                    ,
                    snd_descricao = txtDescricao.Text
                    ,
                    snd_situacao = (ckbBloqueado.Checked ? Convert.ToByte(2) : Convert.ToByte(1))
                    ,
                    snd_dataCriacao = DateTime.Now
                    ,
                    snd_dataAlteracao = DateTime.Now
                    ,
                    IsNew = (VS_snd_id > 0) ? false : true
                };
                
                if (ACA_SondagemBO.Salvar(snd, VS_ListaQuestao, VS_ListaSubQuestao, VS_ListaResposta))
                {
                    string message = "";
                    if (VS_snd_id <= 0)
                    {
                        ApplicationWEB._GravaLogSistema(LOG_SistemaTipo.Insert, "snd_id: " + snd.snd_id);
                        message = UtilBO.GetErroMessage(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.SondagemIncluidaSucesso").ToString(), UtilBO.TipoMensagem.Sucesso);
                    }
                    else
                    {
                        ApplicationWEB._GravaLogSistema(LOG_SistemaTipo.Update, "snd_id: " + snd.snd_id);
                        message = UtilBO.GetErroMessage(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.SondagemAlteradaSucesso").ToString(), UtilBO.TipoMensagem.Sucesso);
                    }

                    if (ParametroPermanecerTela)
                    {
                        lblMessage.Text = message;
                        VS_snd_id = snd.snd_id;
                        _LoadFromEntity(VS_snd_id);
                    }
                    else
                    {
                        __SessionWEB.PostMessages = message;
                        Response.Redirect(__SessionWEB._AreaAtual._Diretorio + "Academico/Sondagem/Busca.aspx", false);
                        HttpContext.Current.ApplicationInstance.CompleteRequest();
                    }
                }
                else
                {
                    lblMessage.Text = UtilBO.GetErroMessage(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.ErroSalvarSondagem").ToString(), UtilBO.TipoMensagem.Erro);
                }
            }
            catch (ValidationException ex)
            {
                lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
            }
            catch (DuplicateNameException ex)
            {
                lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
            }
            catch (ArgumentException ex)
            {
                lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
            }
            catch (Exception ex)
            {
                ApplicationWEB._GravaErro(ex);
                lblMessage.Text = UtilBO.GetErroMessage(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.ErroSalvarSondagem").ToString(), UtilBO.TipoMensagem.Erro);
            }
        }

        /// <summary>
        /// Abre o pop-up para adicionar questão, sub-questão ou resposta
        /// </summary>
        /// <param name="titulo">Título do pop-up</param>
        /// <param name="objeto">Objeto que está sendo cadastrado</param>
        /// <param name="item">Id do item (1-Questão, 2-Sub-Questão, 3-Resposta)</param>
        /// <param name="texto">Texto do item</param>
        private void AbrirPopUp(string titulo, string objeto, byte item, string texto = "", string sigla = "")
        {
            try
            {
                divSigla.Visible = false;
                VS_tipo = item;
                lblTituloPopUp.Text = titulo;
                VS_tipoText = objeto;
                lblCampo.Text = objeto + " *";
                txtItem.Text = texto;
                //Resposta
                if (item == 3)
                {
                    divSigla.Visible = true;
                    txtSigla.Text = sigla;
                    txtSigla.Focus();
                }
                else
                    txtItem.Focus();
                updPopUp.Update();

                btnAdicionar.Text = VS_sdq_id > 0 || VS_sdr_id > 0 ? GetGlobalResourceObject("Academico", "Sondagem.Cadastro.bntAdicionar.Text").ToString() :
                                    GetGlobalResourceObject("Academico", "Sondagem.Cadastro.bntAlterar.Text").ToString();

                ScriptManager.RegisterStartupScript(Page, typeof(Page), "EditarAulas", "$('#divInserir').dialog('open');", true);
            }
            catch (ValidationException ex)
            {
                lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
            }
            catch (Exception ex)
            {
                ApplicationWEB._GravaErro(ex);
                lblMessage.Text = UtilBO.GetErroMessage(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.ErroAbrirPopUp").ToString(), UtilBO.TipoMensagem.Erro);
            }
        }

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager sm = ScriptManager.GetCurrent(this);
            if (sm != null)
            {
                sm.Scripts.Add(new ScriptReference(ArquivoJS.MsgConfirmExclusao));
                sm.Scripts.Add(new ScriptReference("~/Includes/jsCadastroSondagem.js"));
                sm.Scripts.Add(new ScriptReference(ArquivoJS.JQueryValidation));
                sm.Scripts.Add(new ScriptReference(ArquivoJS.JqueryMask));
            }

            if (!IsPostBack)
            {
                try
                {
                    if ((PreviousPage != null) && (PreviousPage.IsCrossPagePostBack))
                    {
                        bntSalvar.Visible = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar;
                        btnCancelar.Text = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar ?
                                           GetGlobalResourceObject("Academico", "Sondagem.Cadastro.btnCancelar.Text").ToString() :
                                           GetGlobalResourceObject("Academico", "Sondagem.Cadastro.btnVoltar.Text").ToString();

                        _LoadFromEntity(PreviousPage.EditItem);
                    }
                    else
                    {
                        bntSalvar.Visible = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_inserir;
                        btnCancelar.Text = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_inserir ?
                                           GetGlobalResourceObject("Academico", "Sondagem.Cadastro.btnCancelar.Text").ToString() :
                                           GetGlobalResourceObject("Academico", "Sondagem.Cadastro.btnVoltar.Text").ToString();
                        ckbBloqueado.Visible = false;

                        grvQuestoes.DataSource = VS_ListaQuestao;
                        grvQuestoes.DataBind();

                        grvSubQuestoes.DataSource = VS_ListaSubQuestao;
                        grvSubQuestoes.DataBind();

                        grvRespostas.DataSource = VS_ListaResposta;
                        grvRespostas.DataBind();
                    }

                    Page.Form.DefaultFocus = txtTitulo.ClientID;
                    Page.Form.DefaultButton = bntSalvar.UniqueID;
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.ErroCarregarSistema").ToString(), UtilBO.TipoMensagem.Erro);
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(__SessionWEB._AreaAtual._Diretorio + "Academico/Sondagem/Busca.aspx", false);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }

        protected void bntSalvar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
                Salvar();
        }

        protected void btnAdicionarQuestao_Click(object sender, EventArgs e)
        {
            VS_sdq_id = 0;
            VS_sdr_id = 0;
            AbrirPopUp(btnAdicionarQuestao.Text, GetGlobalResourceObject("Academico", "Sondagem.Cadastro.grvQuestoes.HeaderNome").ToString(), 1);
        }

        protected void btnAdicionarSubQuestao_Click(object sender, EventArgs e)
        {
            VS_sdq_id = 0;
            VS_sdr_id = 0;
            AbrirPopUp(btnAdicionarSubQuestao.Text, GetGlobalResourceObject("Academico", "Sondagem.Cadastro.grvSubQuestoes.HeaderNome").ToString(), 2);
        }

        protected void btnAdicionarResposta_Click(object sender, EventArgs e)
        {
            VS_sdq_id = 0;
            VS_sdr_id = 0;
            AbrirPopUp(btnAdicionarResposta.Text, GetGlobalResourceObject("Academico", "Sondagem.Cadastro.grvRespostas.HeaderNome").ToString(), 3);
        }

        protected void btnAdicionar_Click(object sender, EventArgs e)
        {
            try
            {
                string mensagem = "";

                if (VS_tipo == 3 && string.IsNullOrEmpty(txtSigla.Text))
                    mensagem = string.Format(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.SiglaObrigatorio").ToString(), VS_tipoText);

                if (string.IsNullOrEmpty(txtItem.Text))
                    mensagem += (string.IsNullOrEmpty(mensagem) ? "" : "<br/>") + string.Format(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.DescricaoObrigatorio").ToString(), VS_tipoText);

                if (!string.IsNullOrEmpty(mensagem))
                    throw new ValidationException(mensagem);

                //Questão
                if (VS_tipo == 1)
                {
                    if (VS_ListaQuestao.Any(p => p.sdq_id != VS_sdq_id && p.sdq_descricao.Equals(txtItem.Text)))
                        throw new ValidationException(string.Format(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.JaExisteItem").ToString(), VS_tipoText));

                    if (VS_sdq_id > 0 && VS_ListaQuestao.Any(l => l.sdq_id == VS_sdq_id))
                        VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == VS_sdq_id).First())].sdq_descricao = txtItem.Text;
                    else
                    {
                        int sdq_id = VS_ListaQuestao.Any() ? VS_ListaQuestao.Max(l => l.sdq_id) + 1 : 1;
                        int sdq_ordem = VS_ListaQuestao.Any() ? VS_ListaQuestao.Max(l => l.sdq_ordem) + 1 : 1;
                        VS_ListaQuestao.Add(new ACA_SondagemQuestao
                        {
                            snd_id = VS_snd_id,
                            sdq_id = sdq_id,
                            sdq_ordem = sdq_ordem,
                            sdq_subQuestao = false,
                            sdq_descricao = txtItem.Text,
                            sdq_situacao = (byte)ACA_SondagemQuestaoSituacao.Ativo,
                            IsNew = true
                        });
                    }

                    VS_ListaQuestao = VS_ListaQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                    grvQuestoes.DataSource = VS_ListaQuestao;
                    grvQuestoes.DataBind();

                    if (grvQuestoes.Rows.Count > 0)
                    {
                        ((ImageButton)grvQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvQuestoes.Rows[grvQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                //Sub-Questão
                else if (VS_tipo == 2)
                {
                    if (VS_ListaSubQuestao.Any(p => p.sdq_id != VS_sdq_id && p.sdq_descricao.Equals(txtItem.Text)))
                        throw new ValidationException(string.Format(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.JaExisteItem").ToString(), VS_tipoText));

                    if (VS_sdq_id > 0 && VS_ListaSubQuestao.Any(l => l.sdq_id == VS_sdq_id))
                        VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == VS_sdq_id).First())].sdq_descricao = txtItem.Text;
                    else
                    {
                        int sdq_id = VS_ListaSubQuestao.Any() ? VS_ListaSubQuestao.Max(l => l.sdq_id) + 1 : 1;
                        int sdq_ordem = VS_ListaSubQuestao.Any() ? VS_ListaSubQuestao.Max(l => l.sdq_ordem) + 1 : 1;
                        VS_ListaSubQuestao.Add(new ACA_SondagemQuestao
                        {
                            snd_id = VS_snd_id,
                            sdq_id = sdq_id,
                            sdq_ordem = sdq_ordem,
                            sdq_subQuestao = true,
                            sdq_descricao = txtItem.Text,
                            sdq_situacao = (byte)ACA_SondagemQuestaoSituacao.Ativo,
                            IsNew = true
                        });
                    }

                    VS_ListaSubQuestao = VS_ListaSubQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                    grvSubQuestoes.DataSource = VS_ListaSubQuestao;
                    grvSubQuestoes.DataBind();

                    if (grvSubQuestoes.Rows.Count > 0)
                    {
                        ((ImageButton)grvSubQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvSubQuestoes.Rows[grvSubQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                //Resposta
                else if (VS_tipo == 3)
                {
                    mensagem = "";

                    if (VS_ListaResposta.Any(p => p.sdr_id != VS_sdr_id && p.sdr_sigla.Equals(txtSigla.Text)))
                        mensagem = string.Format(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.JaExisteSigla").ToString(), VS_tipoText);

                    if (VS_ListaResposta.Any(p => p.sdr_id != VS_sdr_id && p.sdr_descricao.Equals(txtItem.Text)))
                        mensagem += (string.IsNullOrEmpty(mensagem) ? "" : "<br/>") + string.Format(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.JaExisteItem").ToString(), VS_tipoText);
                    
                    if (!string.IsNullOrEmpty(mensagem))
                        throw new ValidationException(mensagem);

                    if (VS_sdr_id > 0 && VS_ListaResposta.Any(l => l.sdr_id == VS_sdr_id))
                    {
                        VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == VS_sdq_id).First())].sdr_descricao = txtItem.Text;
                        VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == VS_sdq_id).First())].sdr_sigla = txtSigla.Text;
                    }
                    else
                    {
                        int sdr_id = VS_ListaResposta.Any() ? VS_ListaResposta.Max(l => l.sdr_id) + 1 : 1;
                        int sdr_ordem = VS_ListaResposta.Any() ? VS_ListaResposta.Max(l => l.sdr_ordem) + 1 : 1;
                        VS_ListaResposta.Add(new ACA_SondagemResposta
                        {
                            snd_id = VS_snd_id,
                            sdr_id = sdr_id,
                            sdr_ordem = sdr_ordem,
                            sdr_sigla = txtSigla.Text,
                            sdr_descricao = txtItem.Text,
                            sdr_situacao = (byte)ACA_SondagemRespostaSituacao.Ativo,
                            IsNew = true
                        });
                    }

                    VS_ListaResposta = VS_ListaResposta.OrderBy(r => r.sdr_ordem).ThenBy(r => r.sdr_sigla).ThenBy(r => r.sdr_descricao).ToList();

                    grvRespostas.DataSource = VS_ListaResposta;
                    grvRespostas.DataBind();

                    if (grvRespostas.Rows.Count > 0)
                    {
                        ((ImageButton)grvRespostas.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvRespostas.Rows[grvRespostas.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }

                ScriptManager.RegisterStartupScript(Page, typeof(Page), "FecharPopUp", "$('#divInserir').dialog('close');", true);
            }
            catch (ValidationException ex)
            {
                lblMessagePopUp.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
            }
            catch (Exception ex)
            {
                ApplicationWEB._GravaErro(ex);
                lblMessagePopUp.Text = UtilBO.GetErroMessage(GetGlobalResourceObject("Academico", "Sondagem.Cadastro.ErroAdicionar").ToString(), UtilBO.TipoMensagem.Erro);
            }
        }

        protected void grvQuestoes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Subir")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idDescer = Convert.ToInt32(grvQuestoes.DataKeys[index - 1]["sdq_id"]);
                    int idSubir = Convert.ToInt32(grvQuestoes.DataKeys[index]["sdq_id"]);
                    int ordemSubir = VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idSubir).First())].sdq_ordem;
                    int ordemDescer = VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idDescer).First())].sdq_ordem;

                    VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idSubir).First())].sdq_ordem = ordemDescer;
                    VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idDescer).First())].sdq_ordem = ordemSubir;

                    VS_ListaQuestao = VS_ListaQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                    grvQuestoes.DataSource = VS_ListaQuestao;
                    grvQuestoes.DataBind();

                    if (grvQuestoes.Rows.Count > 0)
                    {
                        ((ImageButton)grvQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvQuestoes.Rows[grvQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
            else if (e.CommandName == "Descer")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idDescer = Convert.ToInt32(grvQuestoes.DataKeys[index]["sdq_id"]);
                    int idSubir = Convert.ToInt32(grvQuestoes.DataKeys[index + 1]["sdq_id"]);
                    int ordemSubir = VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idSubir).First())].sdq_ordem;
                    int ordemDescer = VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idDescer).First())].sdq_ordem;

                    VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idSubir).First())].sdq_ordem = ordemDescer;
                    VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idDescer).First())].sdq_ordem = ordemSubir;

                    VS_ListaQuestao = VS_ListaQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                    grvQuestoes.DataSource = VS_ListaQuestao;
                    grvQuestoes.DataBind();

                    if (grvQuestoes.Rows.Count > 0)
                    {
                        ((ImageButton)grvQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvQuestoes.Rows[grvQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
            else if (e.CommandName == "Excluir")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idExcluir = Convert.ToInt32(grvQuestoes.DataKeys[index]["sdq_id"]);

                    if (idExcluir > 0 && VS_ListaQuestao.Any(l => l.sdq_id == idExcluir))
                    {
                        if (!VS_permiteEditar)
                            VS_ListaQuestao[VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idExcluir).First())].sdq_situacao = (byte)ACA_SondagemQuestaoSituacao.Excluido;
                        else
                        {
                            int ind = VS_ListaQuestao.IndexOf(VS_ListaQuestao.Where(l => l.sdq_id == idExcluir).First());
                            int ordem = VS_ListaQuestao.Where(l => l.sdq_id == idExcluir).First().sdq_ordem;

                            //Ajusta as ordens
                            for (int i = ind + 1; i < VS_ListaQuestao.Count; i++)
                            {
                                VS_ListaQuestao[i].sdq_ordem = ordem;
                                ordem += 1;
                            }

                            VS_ListaQuestao.RemoveAt(ind);
                        }
                    }
                    VS_ListaQuestao = VS_ListaQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                    grvQuestoes.DataSource = VS_ListaQuestao;
                    grvQuestoes.DataBind();

                    if (grvQuestoes.Rows.Count > 0)
                    {
                        ((ImageButton)grvQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvQuestoes.Rows[grvQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
            else if (e.CommandName == "Alterar")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idAlterar = Convert.ToInt32(grvQuestoes.DataKeys[index]["sdq_id"]);
                    string textoAlterar = grvQuestoes.DataKeys[index]["sdq_descricao"].ToString();

                    VS_sdq_id = idAlterar;
                    AbrirPopUp(btnAdicionarQuestao.Text, GetGlobalResourceObject("Academico", "Sondagem.Cadastro.grvQuestoes.HeaderNome").ToString(), 1, textoAlterar);
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
        }
        
        protected void grvSubQuestoes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Subir")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idDescer = Convert.ToInt32(grvSubQuestoes.DataKeys[index - 1]["sdq_id"]);
                    int idSubir = Convert.ToInt32(grvSubQuestoes.DataKeys[index]["sdq_id"]);
                    int ordemSubir = VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idSubir).First())].sdq_ordem;
                    int ordemDescer = VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idDescer).First())].sdq_ordem;

                    VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idSubir).First())].sdq_ordem = ordemDescer;
                    VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idDescer).First())].sdq_ordem = ordemSubir;

                    VS_ListaSubQuestao = VS_ListaSubQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                    grvSubQuestoes.DataSource = VS_ListaSubQuestao;
                    grvSubQuestoes.DataBind();

                    if (grvSubQuestoes.Rows.Count > 0)
                    {
                        ((ImageButton)grvSubQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvSubQuestoes.Rows[grvSubQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
            else if (e.CommandName == "Descer")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idDescer = Convert.ToInt32(grvSubQuestoes.DataKeys[index]["sdq_id"]);
                    int idSubir = Convert.ToInt32(grvSubQuestoes.DataKeys[index + 1]["sdq_id"]);
                    int ordemSubir = VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idSubir).First())].sdq_ordem;
                    int ordemDescer = VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idDescer).First())].sdq_ordem;

                    VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idSubir).First())].sdq_ordem = ordemDescer;
                    VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idDescer).First())].sdq_ordem = ordemSubir;
                    
                    VS_ListaSubQuestao = VS_ListaSubQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                    grvSubQuestoes.DataSource = VS_ListaSubQuestao;
                    grvSubQuestoes.DataBind();

                    if (grvSubQuestoes.Rows.Count > 0)
                    {
                        ((ImageButton)grvSubQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvSubQuestoes.Rows[grvSubQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
            else if (e.CommandName == "Excluir")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idExcluir = Convert.ToInt32(grvSubQuestoes.DataKeys[index]["sdq_id"]);

                    if (idExcluir > 0 && VS_ListaSubQuestao.Any(l => l.sdq_id == idExcluir))
                    {
                        if (!VS_permiteEditar)
                            VS_ListaSubQuestao[VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idExcluir).First())].sdq_situacao = (byte)ACA_SondagemQuestaoSituacao.Excluido;
                        else
                        {
                            int ind = VS_ListaSubQuestao.IndexOf(VS_ListaSubQuestao.Where(l => l.sdq_id == idExcluir).First());
                            int ordem = VS_ListaSubQuestao.Where(l => l.sdq_id == idExcluir).First().sdq_ordem;

                            //Ajusta as ordens
                            for (int i = ind + 1; i < VS_ListaSubQuestao.Count; i++)
                            {
                                VS_ListaSubQuestao[i].sdq_ordem = ordem;
                                ordem += 1;
                            }

                            VS_ListaSubQuestao.RemoveAt(ind);
                        }
                    }

                    VS_ListaSubQuestao = VS_ListaSubQuestao.OrderBy(q => q.sdq_ordem).ThenBy(q => q.sdq_descricao).ToList();

                    grvSubQuestoes.DataSource = VS_ListaSubQuestao;
                    grvSubQuestoes.DataBind();

                    if (grvSubQuestoes.Rows.Count > 0)
                    {
                        ((ImageButton)grvSubQuestoes.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvSubQuestoes.Rows[grvSubQuestoes.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
            else if (e.CommandName == "Alterar")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idAlterar = Convert.ToInt32(grvSubQuestoes.DataKeys[index]["sdq_id"]);
                    string textoAlterar = grvSubQuestoes.DataKeys[index]["sdq_descricao"].ToString();

                    VS_sdq_id = idAlterar;
                    AbrirPopUp(btnAdicionarSubQuestao.Text, GetGlobalResourceObject("Academico", "Sondagem.Cadastro.grvSubQuestoes.HeaderNome").ToString(), 2, textoAlterar);
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
        }

        protected void grvRespostas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Subir")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idDescer = Convert.ToInt32(grvRespostas.DataKeys[index - 1]["sdr_id"]);
                    int idSubir = Convert.ToInt32(grvRespostas.DataKeys[index]["sdr_id"]);
                    int ordemSubir = VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idSubir).First())].sdr_ordem;
                    int ordemDescer = VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idDescer).First())].sdr_ordem;

                    VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idSubir).First())].sdr_ordem = ordemDescer;
                    VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idDescer).First())].sdr_ordem = ordemSubir;

                    VS_ListaResposta = VS_ListaResposta.OrderBy(r => r.sdr_ordem).ThenBy(r => r.sdr_sigla).ThenBy(r => r.sdr_descricao).ToList();

                    grvRespostas.DataSource = VS_ListaResposta;
                    grvRespostas.DataBind();

                    if (grvRespostas.Rows.Count > 0)
                    {
                        ((ImageButton)grvRespostas.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvRespostas.Rows[grvRespostas.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
            else if (e.CommandName == "Descer")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idDescer = Convert.ToInt32(grvRespostas.DataKeys[index]["sdr_id"]);
                    int idSubir = Convert.ToInt32(grvRespostas.DataKeys[index + 1]["sdr_id"]);
                    int ordemSubir = VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idSubir).First())].sdr_ordem;
                    int ordemDescer = VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idDescer).First())].sdr_ordem;

                    VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idSubir).First())].sdr_ordem = ordemDescer;
                    VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idDescer).First())].sdr_ordem = ordemSubir;

                    VS_ListaResposta = VS_ListaResposta.OrderBy(r => r.sdr_ordem).ThenBy(r => r.sdr_sigla).ThenBy(r => r.sdr_descricao).ToList();

                    grvRespostas.DataSource = VS_ListaResposta;
                    grvRespostas.DataBind();

                    if (grvRespostas.Rows.Count > 0)
                    {
                        ((ImageButton)grvRespostas.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvRespostas.Rows[grvRespostas.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
            else if (e.CommandName == "Excluir")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idExcluir = Convert.ToInt32(grvRespostas.DataKeys[index]["sdr_id"]);

                    if (idExcluir > 0 && VS_ListaResposta.Any(l => l.sdr_id == idExcluir))
                    {
                        if (!VS_permiteEditar)
                            VS_ListaResposta[VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idExcluir).First())].sdr_situacao = (byte)ACA_SondagemQuestaoSituacao.Excluido;
                        else
                        {
                            int ind = VS_ListaResposta.IndexOf(VS_ListaResposta.Where(l => l.sdr_id == idExcluir).First());
                            int ordem = VS_ListaResposta.Where(l => l.sdr_id == idExcluir).First().sdr_ordem;

                            //Ajusta as ordens
                            for (int i = ind + 1; i < VS_ListaResposta.Count; i++)
                            {
                                VS_ListaResposta[i].sdr_ordem = ordem;
                                ordem += 1;
                            }

                            VS_ListaResposta.RemoveAt(ind);
                        }
                    }

                    VS_ListaResposta = VS_ListaResposta.OrderBy(r => r.sdr_ordem).ThenBy(r => r.sdr_sigla).ThenBy(r => r.sdr_descricao).ToList();

                    grvRespostas.DataSource = VS_ListaResposta;
                    grvRespostas.DataBind();

                    if (grvRespostas.Rows.Count > 0)
                    {
                        ((ImageButton)grvRespostas.Rows[0].Cells[2].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                        ((ImageButton)grvRespostas.Rows[grvRespostas.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
                    }
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
            else if (e.CommandName == "Alterar")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());

                    int idAlterar = Convert.ToInt32(grvRespostas.DataKeys[index]["sdr_id"]);
                    string textoAlterar = grvRespostas.DataKeys[index]["sdr_descricao"].ToString();
                    string siglaAlterar = grvRespostas.DataKeys[index]["sdr_sigla"].ToString();

                    VS_sdr_id = idAlterar;
                    AbrirPopUp(btnAdicionarResposta.Text, GetGlobalResourceObject("Academico", "Sondagem.Cadastro.grvRespostas.HeaderNome").ToString(), 3, textoAlterar, siglaAlterar);
                }
                catch (ValidationException ex)
                {
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Alerta);
                }
                catch (Exception ex)
                {
                    ApplicationWEB._GravaErro(ex);
                    lblMessage.Text = UtilBO.GetErroMessage(ex.Message, UtilBO.TipoMensagem.Erro);
                }
            }
        }

        protected void grv_DataBound(object sender, EventArgs e)
        {
            GridView grv = (GridView)sender;
            if (grv.Rows.Count > 0)
            {
                ((ImageButton)grv.Rows[0].FindControl("_btnSubir")).Style.Add("visibility", "hidden");
                ((ImageButton)grv.Rows[grv.Rows.Count - 1].FindControl("_btnDescer")).Style.Add("visibility", "hidden");
            }
        }

        protected void grv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton btnAlterar = (LinkButton)e.Row.FindControl("btnAlterar");
                if (btnAlterar != null)
                {
                    btnAlterar.CommandArgument = e.Row.RowIndex.ToString();
                    //btnAlterar.Visible = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar && VS_permiteEditar;
                }

                //Label lblAlterar = (Label)e.Row.FindControl("lblAlterar");
                //if (lblAlterar != null)
                //{
                //    lblAlterar.Visible = !(__SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar && VS_permiteEditar);
                //}

                ImageButton _btnSubir = (ImageButton)e.Row.FindControl("_btnSubir");
                if (_btnSubir != null)
                {
                    _btnSubir.ImageUrl = __SessionWEB._AreaAtual._DiretorioImagens + "cima.png";
                    _btnSubir.CommandArgument = e.Row.RowIndex.ToString();
                    _btnSubir.Visible = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar && VS_permiteEditar;
                }

                ImageButton _btnDescer = (ImageButton)e.Row.FindControl("_btnDescer");
                if (_btnDescer != null)
                {
                    _btnDescer.ImageUrl = __SessionWEB._AreaAtual._DiretorioImagens + "baixo.png";
                    _btnDescer.CommandArgument = e.Row.RowIndex.ToString();
                    _btnDescer.Visible = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar && VS_permiteEditar;
                }

                ImageButton btnExcluir = (ImageButton)e.Row.FindControl("btnExcluir");
                if (btnExcluir != null)
                {
                    btnExcluir.CommandArgument = e.Row.RowIndex.ToString();
                    btnExcluir.Visible = __SessionWEB.__UsuarioWEB.GrupoPermissao.grp_alterar && VS_permiteEditar;
                }
            }
        }

        #endregion
    }
}