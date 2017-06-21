﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="GestaoEscolar.Classe.RelatorioAtendimento.Cadastro" %>

<%@ PreviousPageType VirtualPath="~/Classe/RelatorioAtendimento/Busca.aspx" %>

<%@ Register Src="~/WebControls/Combos/UCComboRelatorioAtendimento.ascx" TagName="UCCRelatorioAtendimento" TagPrefix="uc" %>
<%@ Register Src="~/WebControls/Combos/Novos/UCCPeriodoCalendario.ascx" TagName="UCCPeriodoCalendario" TagPrefix="uc" %>
<%@ Register Src="~/WebControls/LancamentoRelatorioAtendimento/UCLancamentoRelatorioAtendimento.ascx" TagName="UCLancamentoRelatorioAtendimento" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rel-atendimento">
        <asp:UpdatePanel ID="updMensagem" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="lblMensagem" runat="server"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Panel ID="pnlFiltros" runat="server" GroupingText="Lançamento de relatórios de AEE">
            <asp:UpdatePanel ID="updFiltros" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <uc:UCCRelatorioAtendimento ID="UCCRelatorioAtendimento" runat="server" />
                    <uc:UCCPeriodoCalendario ID="UCCPeriodoCalendario" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="right">
                <asp:UpdatePanel ID="updBotoes" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Visible="false" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CausesValidation="false" OnClick="btnCancelar_Click" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </asp:Panel>
        <asp:UpdatePanel ID="updLancamento" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <asp:Panel id="pnlLancamento" runat="server" Visible="false">
                    <uc:UCLancamentoRelatorioAtendimento ID="UCLancamentoRelatorioAtendimento" runat="server" />
                    <div class="right">
                        <asp:Button ID="btnSalvarBaixo" runat="server" Text="Salvar" />
                        <asp:Button ID="btnCancelarBaixo" runat="server" Text="Cancelar" CausesValidation="false" OnClick="btnCancelar_Click" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
