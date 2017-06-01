﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="GestaoEscolar.Academico.Sondagem.Cadastro" %>

<%@ PreviousPageType VirtualPath="~/Academico/Sondagem/Busca.aspx" %>
<%@ Register Src="~/WebControls/Mensagens/UCCamposObrigatorios.ascx" TagName="UCCamposObrigatorios"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel runat="server" ID="updMessage" UpdateMode="Always">
        <ContentTemplate>
            <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel runat="server" ID="updCadastro" UpdateMode="Always">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <fieldset>
                <legend>
                    <asp:Label runat="server" ID="lblLegend" Text="<%$ Resources:Academico, Sondagem.Cadastro.lblLegend.Text %>" /></legend>
                <uc1:UCCamposObrigatorios ID="UCCamposObrigatorios3" runat="server" />
                <asp:Label ID="lblTitulo" runat="server" Text="<%$ Resources:Academico, Sondagem.Cadastro.lblTitulo.Text %>" AssociatedControlID="txtTitulo" />
                <asp:TextBox ID="txtTitulo" runat="server" SkinID="text60C" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvTitulo" runat="server" ControlToValidate="txtTitulo"
                    Display="Dynamic" ErrorMessage="<%$ Resources:Academico, Sondagem.Cadastro.rfvTitulo.ErrorMessage %>" Text="*" />
                <asp:Label ID="lblDescricao" runat="server" Text="<%$ Resources:Academico, Sondagem.Cadastro.lblDescricao.Text %>" AssociatedControlID="txtDescricao" />
                <asp:TextBox ID="txtDescricao" runat="server" TextMode="MultiLine" SkinID="limite4000" MaxLength="4000"></asp:TextBox>
                <div>
                    <br />
                </div>
                <fieldset>
                    <legend>
                        <asp:Label runat="server" ID="lblLegendQuestoes" Text="<%$ Resources:Academico, Sondagem.Cadastro.lblLegendQuestoes.Text %>" /></legend>
                    <asp:Button runat="server" ID="btnNovaQuestao" Text="<%$ Resources:Academico, Sondagem.Cadastro.btnAdicionarQuestao.Text %>"
                        OnClick="btnNovaQuestao_Click" CausesValidation="false" />
                    <div>
                        <br />
                    </div>
                    <div id="divInserirQuestao" visible="false" runat="server">
                        <asp:UpdatePanel runat="server" ID="updMessagePopUpQuestao" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:Label ID="lblMessagePopUpQuestao" runat="server" EnableViewState="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel runat="server" ID="updPopUpQuestao" UpdateMode="Conditional">
                            <ContentTemplate>
                                <fieldset>
                                    <legend>
                                        <asp:Label runat="server" ID="lblTituloPopUpQuestao" /></legend>
                                    <asp:Label runat="server" ID="lblCampoQuestao" Text="<%$ Resources:Academico, Sondagem.Cadastro.grvQuestoes.HeaderNome %>" AssociatedControlID="txtItemQuestao" />
                                    <asp:TextBox runat="server" ID="txtItemQuestao" SkinID="text60C" MaxLength="250" />
                                    <asp:RequiredFieldValidator ID="revtxtItemQuestao" runat="server" ControlToValidate="txtItemQuestao"
                                        Display="Dynamic" ErrorMessage="Questão é obrigatório." Text="*" />
                                    <div class="right">
                                        <asp:Button ID="btnAdicionarQuestao" runat="server" Text="<%$ Resources:Academico, Sondagem.Cadastro.bntAdicionar.Text %>" CausesValidation="false"
                                            OnClick="btnAdicionarQuestao_Click" />
                                        <asp:Button ID="btnCancelarItemQuestao" runat="server" Text="<%$ Resources:Academico, Sondagem.Cadastro.btnCancelar.Text %>" CausesValidation="false"
                                            OnClick="btnCancelarItemQuestao_Click" />
                                    </div>
                                </fieldset>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <asp:GridView runat="server" ID="grvQuestoes" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="false"
                        DataKeyNames="sdq_id, sdq_descricao, sdq_subQuestao" EmptyDataText="<%$ Resources:Academico, Sondagem.Cadastro.grvQuestoes.EmptyDataText %>"
                        OnDataBound="grv_DataBound" OnRowDataBound="grv_RowDataBound" OnRowCommand="grvQuestoes_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="sdq_ordem" HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvQuestoes.HeaderNumero %>" />
                            <asp:TemplateField HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvQuestoes.HeaderNome %>">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnAlterar" runat="server" CommandName="Alterar" Text='<%# Bind("sdq_descricao") %>' CausesValidation="false"></asp:LinkButton>
                                    <asp:Label ID="lblAlterar" runat="server" Text='<%# Bind("sdq_descricao") %>' Visible="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvQuestoes.HeaderOrdem %>">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sdq_ordem") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="_btnSubir" runat="server" CausesValidation="false" CommandName="Subir"
                                        Height="16" Width="16" />
                                    <asp:ImageButton ID="_btnDescer" runat="server" CausesValidation="false" CommandName="Descer"
                                        Height="16" Width="16" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="center" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvQuestoes.HeaderExcluir %>">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnExcluir" SkinID="btExcluir" runat="server" CommandName="Excluir" CausesValidation="false"
                                        ToolTip="<%$ Resources:Academico, Sondagem.Cadastro.grvQuestoes.btnExcluir.ToolTip %>" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
                <fieldset>
                    <legend>
                        <asp:Label runat="server" ID="lblLegendSubQuestoes" Text="<%$ Resources:Academico, Sondagem.Cadastro.lblLegendSubQuestoes.Text %>" /></legend>
                    <asp:Button runat="server" ID="btnNovaSubQuestao" Text="<%$ Resources:Academico, Sondagem.Cadastro.btnAdicionarSubQuestao.Text %>"
                        OnClick="btnNovaSubQuestao_Click" CausesValidation="false" />
                    <div>
                        <br />
                    </div>
                    <div id="divInserirSubquestao" visible="false" runat="server">
                        <asp:UpdatePanel runat="server" ID="updMessagePopUpSubquestao" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:Label ID="lblMessagePopUpSubquestao" runat="server" EnableViewState="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel runat="server" ID="updPopUpSubquestao" UpdateMode="Conditional">
                            <ContentTemplate>
                                <fieldset>
                                    <legend>
                                        <asp:Label runat="server" ID="lblTituloPopUpSubquestao" Text="Adicionar subquestão" />
                                    </legend>
                                    <asp:Label runat="server" ID="lblCampoSubquestao" Text="Subquestão *" AssociatedControlID="txtItemSubquestao" />
                                    <asp:TextBox runat="server" ID="txtItemSubquestao" SkinID="text60C" MaxLength="250" />
                                    <asp:RequiredFieldValidator ID="revtxtItemSubquestao" runat="server" ControlToValidate="txtItemSubquestao"
                                        Display="Dynamic" ErrorMessage="Subquestão é obrigatório." Text="*" />
                                    <div class="right">
                                        <asp:Button ID="btnAdicionarSubquestao" runat="server" Text="Adicionar" CausesValidation="false" OnClick="btnAdicionarSubquestao_Click" />
                                        <asp:Button ID="btnCancelarItemSubquestao" runat="server" Text="Cancelar" CausesValidation="false" 
                                            OnClick="btnCancelarItemSubquestao_Click" />
                                    </div>
                                </fieldset>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <asp:GridView runat="server" ID="grvSubQuestoes" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="false"
                        DataKeyNames="sdq_id, sdq_descricao, sdq_subQuestao" EmptyDataText="<%$ Resources:Academico, Sondagem.Cadastro.grvSubQuestoes.EmptyDataText %>"
                        OnDataBound="grv_DataBound" OnRowDataBound="grv_RowDataBound" OnRowCommand="grvSubQuestoes_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="sdq_ordem" HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvSubQuestoes.HeaderNumero %>" />
                            <asp:TemplateField HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvSubQuestoes.HeaderNome %>">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnAlterar" runat="server" CommandName="Alterar" Text='<%# Bind("sdq_descricao") %>' CausesValidation="false"></asp:LinkButton>
                                    <asp:Label ID="lblAlterar" runat="server" Text='<%# Bind("sdq_descricao") %>' Visible="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvSubQuestoes.HeaderOrdem %>">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sdq_ordem") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="_btnSubir" runat="server" CausesValidation="false" CommandName="Subir"
                                        Height="16" Width="16" />
                                    <asp:ImageButton ID="_btnDescer" runat="server" CausesValidation="false" CommandName="Descer"
                                        Height="16" Width="16" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="center" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvSubQuestoes.HeaderExcluir %>">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnExcluir" SkinID="btExcluir" runat="server" CommandName="Excluir" CausesValidation="false"
                                        ToolTip="<%$ Resources:Academico, Sondagem.Cadastro.grvSubQuestoes.btnExcluir.ToolTip %>" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
                <fieldset>
                    <legend>
                        <asp:Label runat="server" ID="lblLegendRespostas" Text="<%$ Resources:Academico, Sondagem.Cadastro.lblLegendRespostas.Text %>" /></legend>
                    <asp:Button runat="server" ID="btnNovaResposta" Text="<%$ Resources:Academico, Sondagem.Cadastro.btnAdicionarResposta.Text %>"
                        OnClick="btnNovaResposta_Click" CausesValidation="false" />
                    <div>
                        <br />
                    </div>
                    <div id="divInserirResposta" visible="false" runat="server">
                        <asp:UpdatePanel runat="server" ID="updMessagePopUpResposta" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:Label ID="lblMessagePopUpResposta" runat="server" EnableViewState="False"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel runat="server" ID="updPopUpResposta" UpdateMode="Conditional">
                            <ContentTemplate>
                                <fieldset>
                                    <legend>
                                        <asp:Label runat="server" ID="lblTituloPopUpResposta" Text="Adicionar resposta" />
                                    </legend>
                                    <asp:Label runat="server" ID="lblSigla" Text="Sigla *" AssociatedControlID="txtSigla" />
                                    <asp:TextBox runat="server" ID="txtSigla" SkinID="text10C" MaxLength="20" />
                                    <asp:RequiredFieldValidator ID="revtxtSigla" runat="server" ControlToValidate="txtSigla"
                                        Display="Dynamic" ErrorMessage="Sigla é obrigatório." Text="*" />
                                    <asp:Label runat="server" ID="lblCampoResposta" Text="Resposta/Avaliação *" AssociatedControlID="txtItemResposta" />
                                    <asp:TextBox runat="server" ID="txtItemResposta" SkinID="text60C" MaxLength="250" />
                                    <asp:RequiredFieldValidator ID="revtxtItemResposta" runat="server" ControlToValidate="txtItemResposta"
                                        Display="Dynamic" ErrorMessage="Resposta/Avaliação é obrigatório." Text="*" />
                                    <div class="right">
                                        <asp:Button ID="btnAdicionarResposta" runat="server" Text="Adicionar" CausesValidation="false" OnClick="btnAdicionarResposta_Click" />
                                        <asp:Button ID="btnCancelarItemResposta" runat="server" Text="Cancelar" CausesValidation="false" 
                                            OnClick="btnCancelarItemResposta_Click" />
                                    </div>
                                </fieldset>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <asp:GridView runat="server" ID="grvRespostas" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="false"
                        DataKeyNames="sdr_id, sdr_descricao, sdr_sigla" EmptyDataText="<%$ Resources:Academico, Sondagem.Cadastro.grvRespostas.EmptyDataText %>"
                        OnDataBound="grv_DataBound" OnRowDataBound="grv_RowDataBound" OnRowCommand="grvRespostas_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="sdr_ordem" HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvRespostas.HeaderNumero %>" />
                            <asp:BoundField DataField="sdr_sigla" HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvRespostas.HeaderSigla %>" />
                            <asp:TemplateField HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvRespostas.HeaderNome %>">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnAlterar" runat="server" CommandName="Alterar" Text='<%# Bind("sdr_descricao") %>' CausesValidation="false"></asp:LinkButton>
                                    <asp:Label ID="lblAlterar" runat="server" Text='<%# Bind("sdr_descricao") %>' Visible="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvRespostas.HeaderOrdem %>">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sdr_ordem") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="_btnSubir" runat="server" CausesValidation="false" CommandName="Subir"
                                        Height="16" Width="16" />
                                    <asp:ImageButton ID="_btnDescer" runat="server" CausesValidation="false" CommandName="Descer"
                                        Height="16" Width="16" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="center" HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Academico, Sondagem.Cadastro.grvRespostas.HeaderExcluir %>">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnExcluir" SkinID="btExcluir" runat="server" CommandName="Excluir" CausesValidation="false"
                                        ToolTip="<%$ Resources:Academico, Sondagem.Cadastro.grvRespostas.btnExcluir.ToolTip %>" />
                                </ItemTemplate>
                                <HeaderStyle CssClass="center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </fieldset>
                <asp:CheckBox ID="ckbBloqueado" runat="server" Visible="False" Text="Bloqueado" />
                <div class="right">
                    <asp:Button ID="bntSalvar" runat="server" Text="<%$ Resources:Academico, Sondagem.Cadastro.bntSalvar.Text %>" OnClick="bntSalvar_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="<%$ Resources:Academico, Sondagem.Cadastro.btnCancelar.Text %>" CausesValidation="false"
                        OnClick="btnCancelar_Click" />
                </div>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
