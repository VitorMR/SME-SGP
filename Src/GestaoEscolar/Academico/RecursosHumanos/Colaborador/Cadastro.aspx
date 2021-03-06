﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    Inherits="Academico_RecursosHumanos_Colaborador_Cadastro" Title="Untitled Page"
    CodeBehind="Cadastro.aspx.cs" %>

<%@ PreviousPageType VirtualPath="~/Academico/RecursosHumanos/Colaborador/Busca.aspx" %>
<%@ Register Src="../../../WebControls/Combos/UCComboColaboradorSituacao.ascx" TagName="UCComboColaboradorSituacao"
    TagPrefix="uc2" %>
<%@ Register Src="../../../WebControls/Pessoa/UCCadastroPessoa.ascx" TagName="UCCadastroPessoa"
    TagPrefix="uc3" %>
<%@ Register Src="../../../WebControls/Contato/UCContato.ascx" TagName="UCContato"
    TagPrefix="uc19" %>
<%@ Register Src="../../../WebControls/Documento/UCGridDocumento.ascx" TagName="UCGridDocumento"
    TagPrefix="uc7" %>
<%@ Register Src="../../../WebControls/Cargo/UCCadastroCargo.ascx" TagName="UCCadastroCargo"
    TagPrefix="uc12" %>
<%@ Register Src="../../../WebControls/Funcao/UCCadastroFuncao.ascx" TagName="UCCadastroFuncao"
    TagPrefix="uc14" %>
<%@ Register Src="../../../WebControls/Busca/UCPessoas.ascx" TagName="UCPessoas"
    TagPrefix="uc16" %>
<%@ Register Src="../../../WebControls/Busca/UCUA.ascx" TagName="UCUA" TagPrefix="uc17" %>
<%@ Register Src="../../../WebControls/Mensagens/UCCamposObrigatorios.ascx" TagName="UCCamposObrigatorios"
    TagPrefix="uc18" %>
<%@ Register Src="../../../WebControls/Endereco/UCEnderecos.ascx" TagName="UCEnderecos"
    TagPrefix="uc9" %>
<%@ Register Src="../../../WebControls/Mensagens/UCLoader.ascx" TagName="UCLoader"
    TagPrefix="uc1" %>
<%@ Register Src="../../../WebControls/Cidade/UCCadastroCidade.ascx" TagName="UCCadastroCidade"
    TagPrefix="uc8" %>
<%@ Register Src="../../../WebControls/CertidaoCivil/UCCertidaoCivil.ascx" TagName="UCCertidaoCivil"
    TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divCadastroCidade" title="Cadastro de cidades" class="hide">
        <asp:UpdatePanel ID="_updCidades" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <uc1:UCLoader ID="loaderCadastroCidades" runat="server" AssociatedUpdatePanelID="_updCidades" />
                <uc8:UCCadastroCidade ID="UCCadastroCidade1" runat="server" Visible="false" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="divBuscaPessoa" title="Busca de pessoas" class="hide">
        <asp:UpdatePanel ID="_updBuscaPessoa" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <uc1:UCLoader ID="UCLoader1" runat="server" AssociatedUpdatePanelID="_updBuscaPessoa" />
                <uc16:UCPessoas ID="UCPessoas1" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="divBuscaUA" title="Busca de unidades administrativas" class="hide">
        <asp:UpdatePanel ID="_updBuscaUA" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <uc1:UCLoader ID="UCLoader2" runat="server" AssociatedUpdatePanelID="_updBuscaUA" />
                <uc17:UCUA ID="UCUA1" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="divEnderecos" title="Cadastro de endereços" class="hide">
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="Endereco" />
        <fieldset>
            <asp:UpdatePanel ID="_updBotoesEndereco" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <uc1:UCLoader ID="UCLoader3" runat="server" AssociatedUpdatePanelID="_updBotoesEndereco" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </fieldset>
    </div>
    <div id="divCargos" title="Cadastro de cargos" class="hide">
        <uc12:UCCadastroCargo ID="UCCadastroCargo1" runat="server" />
    </div>
    <div id="divFuncoes" title="Cadastro de funções" class="hide">
        <uc14:UCCadastroFuncao ID="UCCadastroFuncao1" runat="server" />
    </div>
    <asp:UpdatePanel ID="upnMessage" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Label ID="_lblMessage" runat="server" EnableViewState="False"></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Pessoa" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="divColaborador" runat="server">
        <div id="divTabs">
            <ul class="hide">
                <li><a href="#divTabs-0">Dados pessoais</a></li>
                <li><a href="#divTabs-1">Endereço / contato</a></li>
                <li><a href="#divTabs-2">Documentação</a></li>
                <li><a href="#divTabs-3">Vínculos de trabalho</a></li>
                <li><a href="#divTabs-4">Usuários</a></li>
            </ul>
            <div id="divTabs-0">
                <fieldset id="fdsDadosPessoais" runat="server">
                    <uc18:UCCamposObrigatorios ID="UCCamposObrigatorios" runat="server" />
                    <uc3:UCCadastroPessoa ID="UCCadastroPessoa1" runat="server" _VS_pagina="Colaboradores" />
                    <asp:Label ID="LabelDataAdmissao" runat="server" Text="Data de admissão *" AssociatedControlID="_txtDataAdmissao"></asp:Label>
                    <asp:TextBox ID="_txtDataAdmissao" runat="server" MaxLength="10" ValidationGroup="Pessoa"
                        SkinID="Data"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="_rfvDataAdmissao" runat="server" ControlToValidate="_txtDataAdmissao"
                        ValidationGroup="Pessoa" ErrorMessage="Data de admissão é obrigatório." Display="Dynamic">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cvDataAdmissao" runat="server" ControlToValidate="_txtDataAdmissao"
                        ValidationGroup="Pessoa" Display="Dynamic" ErrorMessage="" OnServerValidate="ValidarData_ServerValidate">* </asp:CustomValidator>
                    <asp:Label ID="LabelDataDemissao" runat="server" Text="Data de demissão" AssociatedControlID="_txtDataDemissao"></asp:Label>
                    <asp:TextBox ID="_txtDataDemissao" runat="server" MaxLength="10" SkinID="Data"></asp:TextBox>
                    <asp:CustomValidator ID="cvDataDemissao" runat="server" ControlToValidate="_txtDataDemissao"
                        ValidationGroup="Pessoa" Display="Dynamic" ErrorMessage="" OnServerValidate="ValidarData_ServerValidate">* </asp:CustomValidator>
                    <uc2:UCComboColaboradorSituacao ID="UCComboColaboradorSituacao1" runat="server" />                 
                </fieldset>
            </div>
            <div id="divTabs-1" class="hide">
                <br />
                <fieldset id="fdsEndereco" runat="server">
                    <legend>Cadastro de endereços</legend>
                    <uc9:UCEnderecos ID="UCEnderecos1" runat="server" />
                </fieldset>
                <fieldset id="fdsContato" runat="server">
                    <legend>Cadastro de contatos</legend>
                    <uc19:UCContato ID="UCContato1" runat="server" _VS_ValidationGroup="Pessoa" />
                </fieldset>
            </div>
            <div id="divTabs-2" class="hide">
                <asp:UpdatePanel ID="updDocumentacao" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <fieldset id="fdsDocumento" runat="server">
                            <uc7:UCGridDocumento ID="UCGridDocumento1" runat="server" />
                        </fieldset>
                        <fieldset id="fdsCertidoes" runat="server">
                            <legend>Cadastro de certidão civil</legend>
                            <uc4:UCCertidaoCivil ID="UCCertidaoCivil1" runat="server" />
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="divTabs-3" class="hide">
                <fieldset id="fdsCargosFuncoes" runat="server">
                    <asp:UpdatePanel ID="_updGridCargosFuncoes" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <uc1:UCLoader ID="UCLoader4" runat="server" AssociatedUpdatePanelID="_updGridCargosFuncoes" />
                            <div>
                                <asp:Button ID="_btnNovoCargo" runat="server" CausesValidation="False" Text="Adicionar cargo"
                                    OnClick="_btnNovoCargo_Click" />
                                <asp:Button ID="_btnNovaFuncao" runat="server" CausesValidation="False" Text="Adicionar função"
                                    OnClick="_btnNovaFuncao_Click" />
                            </div>
                            <asp:GridView ID="_grvCargosFuncoes" runat="server" AutoGenerateColumns="False" OnRowCommand="_grvCargosFuncoes_RowCommand"
                                OnRowDataBound="_grvCargosFuncoes_RowDataBound" EmptyDataText="Não existem cargos/funções cadastradas."
                                DataKeyNames="crg_id,seqcrg_id,fun_id,seqfun_id">
                                <Columns>
                                    <asp:TemplateField HeaderText="Matrícula">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("coc_matricula") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="_lblMatricula" runat="server" Text='<%# Bind("coc_matricula") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cargo / função">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cargofuncao") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="_btnSelecionar" runat="server" CausesValidation="False" CommandName="Alterar"
                                                Text='<%# Bind("cargofuncao") %>'></asp:LinkButton>
                                            <asp:Label ID="_lblSelecionar" runat="server" Text='<%# Bind("cargofuncao") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="uad_nome" HeaderText="Unidade administrativa" />
                                    <asp:BoundField HeaderText="Vigência" DataField="vigencia" HeaderStyle-HorizontalAlign="Center"
                                        ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Vínculo extra">
                                        <HeaderStyle CssClass="center" />
                                        <ItemTemplate>
                                            <asp:Label ID="lblVinculoExtra" runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Situação" DataField="situacao" HeaderStyle-HorizontalAlign="Center"
                                        ItemStyle-HorizontalAlign="Center">
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Excluir">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="_btnExcluir" runat="server" SkinID="btExcluir" CausesValidation="False"
                                                CommandName="Excluir" />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="center" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </fieldset>
            </div>
            <div id="divTabs-4" class="hide">
                <asp:UpdatePanel ID="_updUsuarios" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <uc1:UCLoader ID="UCLoader5" runat="server" AssociatedUpdatePanelID="_updUsuarios" />
                        <fieldset id="fdsCriarUsuario" runat="server">
                            <asp:CheckBox ID="_chbCriarUsuario" runat="server" AutoPostBack="True" OnCheckedChanged="_chbCriarUsuario_CheckedChanged"
                                Text="Criar usuário" />
                        </fieldset>
                        <div id="divUsuarios" runat="server" visible="false">
                            <fieldset id="fdsUsuario" runat="server">
                                <legend>Cadastro de usuário do colaborador</legend>
                                <asp:CheckBox ID="_ckbUsuarioAD" runat="server" AutoPostBack="True" OnCheckedChanged="_ckbUsuarioAD_CheckedChanged"
                                    Text="Usuário do AD" />
                                <asp:CheckBox ID="_ckbUserLive" runat="server" Text="Integrar usuário live" AutoPostBack="True"
                                    OnCheckedChanged="_ckbUserLive_CheckedChanged" />
                                <div id="divDominios" visible="false" runat="server">
                                    <asp:Label ID="Label" runat="server" Text="Domínio" AssociatedControlID="_ddlDominios"></asp:Label>
                                    <asp:DropDownList ID="_ddlDominios" runat="server" AutoPostBack="True" SkinID="text30C"
                                        OnSelectedIndexChanged="_ddlDominios_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <div id="divOutrosDominios" visible="false" runat="server">
                                        <asp:Label ID="Label5" runat="server" Text="Outro domínio" AssociatedControlID="_txtDominio"></asp:Label>
                                        <asp:TextBox ID="_txtDominio" runat="server" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Label ID="Label1" runat="server" Text="Login *" AssociatedControlID="_txtLogin"></asp:Label>
                                <asp:TextBox ID="_txtLogin" runat="server" MaxLength="100" SkinID="text30C"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="_rfvLogin" runat="server" ControlToValidate="_txtLogin"
                                    ValidationGroup="Pessoa" ErrorMessage="Login é obrigatório." Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:Label ID="_lblEmail" runat="server" Text="E-mail" AssociatedControlID="_txtEmail"></asp:Label>
                                <asp:TextBox ID="_txtEmail" runat="server" Columns="50" MaxLength="200" SkinID="text60C"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="_rfvEmail" runat="server" ControlToValidate="_txtEmail"
                                    ValidationGroup="Pessoa" ErrorMessage="E-mail é obrigatório." Display="Dynamic">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="_revEmail" runat="server" ControlToValidate="_txtEmail"
                                    ValidationGroup="Pessoa" ErrorMessage="E-mail de usuário está fora do padrão ( seuEmail@seuProvedor )."
                                    Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                <div id="divOpcoesSenha" runat="server">
                                    <asp:CheckBox ID="_chkSenhaAutomatica" runat="server" AutoPostBack="True" OnCheckedChanged="_chkSenhaAutomatica_CheckedChanged"
                                        Text="Gerar senha e enviar para o e-mail" />
                                    <asp:Label ID="_lblSenha" runat="server" Text="Senha *" AssociatedControlID="_txtSenha"></asp:Label>
                                    <asp:TextBox ID="_txtSenha" runat="server" MaxLength="256" TextMode="Password" SkinID="text20C"
                                        EnableViewState="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="_rfvSenha" runat="server" ControlToValidate="_txtSenha"
                                        ValidationGroup="Pessoa" ErrorMessage="Senha é obrigatório." Display="Dynamic">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revSenha" runat="server" ControlToValidate="_txtSenha"
                                        ValidationGroup="Pessoa" Display="Dynamic" ErrorMessage="A senha não pode conter espaços em branco."
                                        ValidationExpression="[^\s]+" Enabled="false">*</asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="revSenhaTamanho" runat="server" ControlToValidate="_txtSenha"
                                        ValidationGroup="Pessoa" Display="Dynamic" ErrorMessage="A senha deve conter {0}."
                                        Enabled="false">*</asp:RegularExpressionValidator>
                                    <asp:Label ID="_lblConfirmacao" runat="server" Text="Confirmar senha *" AssociatedControlID="_txtConfirmacao"></asp:Label>
                                    <asp:TextBox ID="_txtConfirmacao" runat="server" MaxLength="256" TextMode="Password"
                                        SkinID="text20C" EnableViewState="true"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="_rfvConfirmarSenha" runat="server" ControlToValidate="_txtConfirmacao"
                                        ValidationGroup="Pessoa" ErrorMessage="Confirmar senha é obrigatório." Display="Dynamic">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="_cpvConfirmarSenha" runat="server" ControlToCompare="_txtSenha"
                                        ValidationGroup="Pessoa" ControlToValidate="_txtConfirmacao" ErrorMessage="Senha não confere."
                                        Display="Dynamic">*</asp:CompareValidator>
                                    <asp:CheckBox ID="_chkExpiraSenha" runat="server" Text="Expira senha" />
                                </div>
                                <asp:CheckBox ID="_chkBloqueado" runat="server" Text="Bloqueado" />
                            </fieldset>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <fieldset id="fdsBotoes">
            <div class="right">
                <asp:Button ID="_btnSalvar" runat="server" Text="Salvar" OnClick="_btnSalvar_Click"
                    ValidationGroup="Pessoa" />
                <asp:Button ID="_btnCancelar" runat="server" Text="Cancelar" CausesValidation="False"
                    OnClick="_btnCancelar_Click" />
                <input id="txtSelectedTab" type="hidden" class="txtSelectedTab" runat="server" />
            </div>
        </fieldset>
    </div>
</asp:Content>
