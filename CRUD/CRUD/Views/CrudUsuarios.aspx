<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrudUsuarios.aspx.cs" Inherits="CRUD.Views.CrudUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>

	<script>
		function openWindow() {
			App.winDetails.show();
			console.log("hello");
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<ext:ResourceManager runat="server" Theme="Neptune" />

		<ext:Viewport runat="server" Layout="BorderLayout">
			<Items>
				<ext:Panel
					runat="server"
					Region="North"
					Border="false"
					Height="120"
					BodyPadding="6">
					<Content>
						<h1>Clientes</h1>
						<p>Usuarios Registrados en el programa.</p>
					</Content>
				</ext:Panel>
				<ext:GridPanel
					ID="GridPanel1"
					runat="server"
					Region="Center"
					Title="Usuarios"
					Icon="User"
					Frame="true">
					<Store>
						<ext:Store
							ID="Store1"
							runat="server"
							AutomaticResponseValues="false">
							<Model>
								<ext:Model runat="server" IDProperty="SupplierID">
									<Fields>
										<ext:ModelField Name="SupplierID" />
										<ext:ModelField Name="CompanyName" />
										<ext:ModelField Name="ContactName" />
										<ext:ModelField Name="ContactTitle" />
										<ext:ModelField Name="Address" />
										<ext:ModelField Name="City" />
										<ext:ModelField Name="Region" />
										<ext:ModelField Name="PostalCode" />
										<ext:ModelField Name="Country" />
										<ext:ModelField Name="Phone" />
										<ext:ModelField Name="Fax" />
									</Fields>
								</ext:Model>
							</Model>
							<ServerProxy>
								<ext:PageProxy>
									<RequestConfig>
										<EventMask ShowMask="true" CustomTarget="App.GridPanel1.getView().el" />
									</RequestConfig>
								</ext:PageProxy>
							</ServerProxy>
							<Sorters>
								<ext:DataSorter Property="CompanyName" Direction="ASC" />
							</Sorters>
							<Listeners>
								<Write Handler="Ext.Msg.alert('Success', 'The suppliers have been saved');" />
							</Listeners>
						</ext:Store>
					</Store>
					<ColumnModel runat="server">
						<Columns>
							<ext:Column runat="server" DataIndex="CompanyName" Text="Company Name" Flex="1">
								<Editor>
									<ext:TextField ID="TextField1" runat="server" />
								</Editor>
							</ext:Column>
							<ext:Column runat="server" DataIndex="ContactName" Text="Contact Name">
								<Editor>
									<ext:TextField ID="TextField2" runat="server" />
								</Editor>
							</ext:Column>
							<ext:Column runat="server" DataIndex="ContactTitle" Text="Contact Title">
								<Editor>
									<ext:TextField ID="TextField3" runat="server" />
								</Editor>
							</ext:Column>
							<ext:Column runat="server" DataIndex="Address" Text="Address">
								<Editor>
									<ext:TextField ID="TextField4" runat="server" />
								</Editor>
							</ext:Column>
							<ext:Column runat="server" DataIndex="City" Text="City">
								<Editor>
									<ext:TextField ID="TextField5" runat="server" />
								</Editor>
							</ext:Column>
							<ext:Column runat="server" DataIndex="Region" Text="Region">
								<Editor>
									<ext:TextField ID="TextField6" runat="server" />
								</Editor>
							</ext:Column>
							<ext:Column runat="server" DataIndex="PostalCode" Text="Postal Code">
								<Editor>
									<ext:TextField ID="TextField7" runat="server" />
								</Editor>
							</ext:Column>
							<ext:Column runat="server" DataIndex="Country" Text="Country">
								<Editor>
									<ext:TextField ID="TextField8" runat="server" />
								</Editor>
							</ext:Column>
							<ext:Column runat="server" DataIndex="Phone" Text="Phone">
								<Editor>
									<ext:TextField ID="TextField9" runat="server" />
								</Editor>
							</ext:Column>
							<ext:Column runat="server" DataIndex="Fax" Text="Fax">
								<Editor>
									<ext:TextField ID="TextField10" runat="server" />
								</Editor>
							</ext:Column>
						</Columns>
					</ColumnModel>

					<SelectionModel>
						<ext:RowSelectionModel runat="server" Mode="Multi">
							<Listeners>
								<Select Handler="#{btnDelete}.enable();" />
								<Deselect Handler="if (!#{GridPanel1}.selModel.hasSelection()) {
                                                       #{btnDelete}.disable();
                                                   }" />
							</Listeners>
						</ext:RowSelectionModel>
					</SelectionModel>

					<Plugins>
						<ext:CellEditing runat="server" />
					</Plugins>

					<Buttons>
						<ext:Button ID="InsertUser" runat="server" Text="Insert" Icon="UserAdd">
							<Listeners>
								<Click Handler="openWindow();" />
							</Listeners>
						</ext:Button>

						<ext:Button ID="btnDelete" runat="server" Text="Delete" Icon="Delete" Disabled="true">
							<Listeners>
								<Click Handler="#{GridPanel1}.deleteSelected();
                                                if (!#{GridPanel1}.hasSelection()) {
                                                    #{btnDelete}.disable();
                                                }" />
							</Listeners>
						</ext:Button>

						<ext:Button runat="server" Text="Save" Icon="Disk">
							<Listeners>
								<Click Handler="#{Store1}.sync();" />
							</Listeners>
						</ext:Button>

						<ext:Button runat="server" Text="Clear" Icon="Cancel">
							<Listeners>
								<Click Handler="#{GridPanel1}.getSelectionModel().deselectAll();;
                                                if (!#{GridPanel1}.hasSelection()) {
                                                    #{btnDelete}.disable();
                                                }" />
							</Listeners>
						</ext:Button>

						<ext:Button runat="server" Text="Refresh" Icon="ArrowRefresh">
							<Listeners>
								<Click Handler="#{Store1}.reload();" />
							</Listeners>
						</ext:Button>
					</Buttons>
				</ext:GridPanel>
			</Items>
		</ext:Viewport>
		<ext:Window
			ID="winDetails"
			runat="server"
			Title="Registrar Usuario"
			Icon="Group"
			Width="400"
			Height="400"
			Modal="true"
			Hidden="true"
			Layout="Fit">
			<Items>
				<ext:TabPanel runat="server" Border="false">
					<Items>

						<ext:FormPanel
							ID="PersonalInfoTab"
							runat="server"
							Title="Información personal"
							Icon="User"
							DefaultAnchor="100%"
							BodyPadding="5">
							<Items>
								<ext:TextField ID="EmployeeID" runat="server" FieldLabel="Cedula"  Name="EmployeeID" />
								<ext:TextField ID="TextField11" runat="server" FieldLabel="Primer nombre"  Name="" />
								<ext:TextField ID="TextField12" runat="server" FieldLabel="Segundo nombre"  Name="EmployeeID" />
								<ext:TextField ID="TextField13" runat="server" FieldLabel="Primer apellido"  Name="EmployeeID" />
								<ext:TextField ID="TextField14" runat="server" FieldLabel="Segundo apellido"  Name="EmployeeID" />
								<ext:TextField ID="Address" runat="server" FieldLabel="Dirección" Name="Address" />
								<ext:TextField ID="City" runat="server" FieldLabel="City" Name="City" />
								<ext:DateField ID="BirthDate" runat="server" FieldLabel="Birth date" Format="yyyy-MM-dd" Name="BirthDate" />
								
							</Items>
						</ext:FormPanel>
						<ext:FormPanel
							ID="CompanyInfoTab"
							runat="server"
							Title=""
							Icon="ChartOrganisation"
							DefaultAnchor="100%"
							BodyPadding="5">
							<Items>
							</Items>
						</ext:FormPanel>
					</Items>
				</ext:TabPanel>
			</Items>
			<Buttons>
				<ext:Button ID="btnPrevious" runat="server" Text="Previous" Icon="PreviousGreen">
					<Listeners>
						<Click Handler="CompanyX.previous();" />
					</Listeners>
				</ext:Button>

				<ext:Button ID="btnSave" runat="server" Text="Save" Icon="Disk">
					<Listeners>
						<Click Handler="" />
					</Listeners>
				</ext:Button>

				<ext:Button ID="btnCancel" runat="server" Text="Cancel" Icon="Cancel">
					<Listeners>
						<Click Handler="this.up('window').hide();" />
					</Listeners>
				</ext:Button>

				<ext:Button ID="btnNext" runat="server" Text="Next" Icon="NextGreen">

					<Listeners>
						<Click Handler="CompanyX.next();" />
					</Listeners>
				</ext:Button>
			</Buttons>
		</ext:Window>
	</form>
</body>
</html>
