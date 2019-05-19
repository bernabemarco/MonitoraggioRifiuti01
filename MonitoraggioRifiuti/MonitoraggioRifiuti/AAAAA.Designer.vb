<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AAAAA
    Inherits System.Windows.Forms.Form

    'Form esegue l'override del metodo Dispose per pulire l'elenco dei componenti.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Richiesto da Progettazione Windows Form
    Private components As System.ComponentModel.IContainer

    'NOTA: la procedura che segue è richiesta da Progettazione Windows Form
    'Può essere modificata in Progettazione Windows Form.  
    'Non modificarla mediante l'editor del codice.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(AAAAA))
        Me.SicuraDataSet = New MonitoraggioRifiuti.SicuraDataSet()
        Me.Codici_CER1BindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Codici_CER1TableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Codici_CER1TableAdapter()
        Me.TableAdapterManager = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager()
        Me.Codici_CER1BindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.Codici_CER1DataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.Codici_CER1BindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Codici_CER1BindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Codici_CER1BindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Codici_CER1BindingNavigator.SuspendLayout()
        CType(Me.Codici_CER1DataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'SicuraDataSet
        '
        Me.SicuraDataSet.DataSetName = "SicuraDataSet"
        Me.SicuraDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Codici_CER1BindingSource
        '
        Me.Codici_CER1BindingSource.DataMember = "Codici_CER1"
        Me.Codici_CER1BindingSource.DataSource = Me.SicuraDataSet
        '
        'Codici_CER1TableAdapter
        '
        Me.Codici_CER1TableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.Codici_CER1TableAdapter = Me.Codici_CER1TableAdapter
        Me.TableAdapterManager.Codici_CERTableAdapter = Nothing
        Me.TableAdapterManager.EXTRATESTEDOCTableAdapter = Nothing
        Me.TableAdapterManager.EXTRATESTERIFIUTITableAdapter = Nothing
        Me.TableAdapterManager.RIGHEDOCUMENTITableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Codici_CER1BindingNavigator
        '
        Me.Codici_CER1BindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.Codici_CER1BindingNavigator.BindingSource = Me.Codici_CER1BindingSource
        Me.Codici_CER1BindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Codici_CER1BindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.Codici_CER1BindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.Codici_CER1BindingNavigatorSaveItem})
        Me.Codici_CER1BindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Codici_CER1BindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Codici_CER1BindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Codici_CER1BindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Codici_CER1BindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Codici_CER1BindingNavigator.Name = "Codici_CER1BindingNavigator"
        Me.Codici_CER1BindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Codici_CER1BindingNavigator.Size = New System.Drawing.Size(800, 25)
        Me.Codici_CER1BindingNavigator.TabIndex = 0
        Me.Codici_CER1BindingNavigator.Text = "BindingNavigator1"
        '
        'BindingNavigatorSeparator
        '
        Me.BindingNavigatorSeparator.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorPositionItem
        '
        Me.BindingNavigatorPositionItem.AccessibleName = "Posizione"
        Me.BindingNavigatorPositionItem.AutoSize = False
        Me.BindingNavigatorPositionItem.Name = "BindingNavigatorPositionItem"
        Me.BindingNavigatorPositionItem.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem.Text = "0"
        Me.BindingNavigatorPositionItem.ToolTipText = "Posizione corrente"
        '
        'BindingNavigatorCountItem
        '
        Me.BindingNavigatorCountItem.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(34, 22)
        Me.BindingNavigatorCountItem.Text = "di {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Numero totale di elementi"
        '
        'BindingNavigatorSeparator1
        '
        Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorSeparator2
        '
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 25)
        '
        'Codici_CER1DataGridView
        '
        Me.Codici_CER1DataGridView.AutoGenerateColumns = False
        Me.Codici_CER1DataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Codici_CER1DataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3})
        Me.Codici_CER1DataGridView.DataSource = Me.Codici_CER1BindingSource
        Me.Codici_CER1DataGridView.Location = New System.Drawing.Point(12, 34)
        Me.Codici_CER1DataGridView.Name = "Codici_CER1DataGridView"
        Me.Codici_CER1DataGridView.Size = New System.Drawing.Size(606, 220)
        Me.Codici_CER1DataGridView.TabIndex = 1
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "CODCER"
        Me.DataGridViewTextBoxColumn1.HeaderText = "CODCER"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "DESCRIZIONECER"
        Me.DataGridViewTextBoxColumn2.HeaderText = "DESCRIZIONECER"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumn3.HeaderText = "ID"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        Me.DataGridViewTextBoxColumn3.ReadOnly = True
        '
        'BindingNavigatorAddNewItem
        '
        Me.BindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorAddNewItem.Image = CType(resources.GetObject("BindingNavigatorAddNewItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorAddNewItem.Name = "BindingNavigatorAddNewItem"
        Me.BindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorAddNewItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorAddNewItem.Text = "Aggiungi nuovo"
        '
        'BindingNavigatorDeleteItem
        '
        Me.BindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorDeleteItem.Image = CType(resources.GetObject("BindingNavigatorDeleteItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorDeleteItem.Text = "Elimina"
        '
        'BindingNavigatorMoveFirstItem
        '
        Me.BindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveFirstItem.Text = "Sposta in prima posizione"
        '
        'BindingNavigatorMovePreviousItem
        '
        Me.BindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMovePreviousItem.Text = "Sposta indietro"
        '
        'BindingNavigatorMoveNextItem
        '
        Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveNextItem.Text = "Sposta avanti"
        '
        'BindingNavigatorMoveLastItem
        '
        Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveLastItem.Text = "Sposta in ultima posizione"
        '
        'Codici_CER1BindingNavigatorSaveItem
        '
        Me.Codici_CER1BindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.Codici_CER1BindingNavigatorSaveItem.Image = CType(resources.GetObject("Codici_CER1BindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.Codici_CER1BindingNavigatorSaveItem.Name = "Codici_CER1BindingNavigatorSaveItem"
        Me.Codici_CER1BindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.Codici_CER1BindingNavigatorSaveItem.Text = "Salva dati"
        '
        'AAAAA
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(800, 450)
        Me.Controls.Add(Me.Codici_CER1DataGridView)
        Me.Controls.Add(Me.Codici_CER1BindingNavigator)
        Me.Name = "AAAAA"
        Me.Text = "AAAAA"
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Codici_CER1BindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Codici_CER1BindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Codici_CER1BindingNavigator.ResumeLayout(False)
        Me.Codici_CER1BindingNavigator.PerformLayout()
        CType(Me.Codici_CER1DataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents SicuraDataSet As SicuraDataSet
    Friend WithEvents Codici_CER1BindingSource As BindingSource
    Friend WithEvents Codici_CER1TableAdapter As SicuraDataSetTableAdapters.Codici_CER1TableAdapter
    Friend WithEvents TableAdapterManager As SicuraDataSetTableAdapters.TableAdapterManager
    Friend WithEvents Codici_CER1BindingNavigator As BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem As ToolStripButton
    Friend WithEvents BindingNavigatorCountItem As ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem As ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As ToolStripSeparator
    Friend WithEvents Codici_CER1BindingNavigatorSaveItem As ToolStripButton
    Friend WithEvents Codici_CER1DataGridView As DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As DataGridViewTextBoxColumn
End Class
