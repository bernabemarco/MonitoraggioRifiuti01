


Public Class RiepilogoGenerale




    Private Sub RiepilogoGenerale_Load(sender As Object, e As EventArgs) Handles MyBase.Load



        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.RiepilogoGeneraleDT'. È possibile spostarla o rimuoverla se necessario.
        Me.RiepilogoGeneraleDTTableAdapter.FillRiepGenerale(Me.SicuraDataSet.RiepilogoGeneraleDT)

        For Each Row As DataGridViewRow In RiepilogoGeneraleDTDataGridView.Rows
            Row.Cells(1).Value = StatoImageList.Images(CInt(Row.Cells(10).Value))
        Next


    End Sub




    Private Sub ApplicaFiltro_Click(sender As Object, e As EventArgs) Handles ApplicaFiltro.Click
        Dim strSearc As String

        strSearc = Me.TextBoxFiltro.Text
        Me.RiepilogoGeneraleDTBindingSource.Filter = "CLIENTE Like '%" & strSearc & "%'"

    End Sub

    Private Sub RimuoviFiltro_Click(sender As Object, e As EventArgs) Handles RimuoviFiltro.Click
        Me.RiepilogoGeneraleDTBindingSource.Filter = ""
        Me.RiepilogoGeneraleDTDataGridView.Update()
    End Sub

    Private Sub DettDoc_Click(sender As Object, e As EventArgs) Handles DettDoc.Click
        Dim FrmDett As New DettaglioDoc

        FrmDett.stringfilter = RiepilogoGeneraleDTDataGridView.CurrentRow.Cells(0).Value.ToString()
        FrmDett.Show()
    End Sub

    Private Sub BtnTornaMain_Click(sender As Object, e As EventArgs) Handles BtnTornaMain.Click
        Main.Visible = True
        Me.Visible = False

    End Sub

    Private Sub ToolStripButton1_Click(sender As Object, e As EventArgs) Handles ToolStripButton1.Click
        Me.RiepilogoGeneraleDTTableAdapter.FillRiepGenerale(Me.SicuraDataSet.RiepilogoGeneraleDT)

        For Each Row As DataGridViewRow In RiepilogoGeneraleDTDataGridView.Rows
            Row.Cells(1).Value = StatoImageList.Images(CInt(Row.Cells(10).Value))
        Next
    End Sub



    Private Sub RiepilogoGeneraleDTDataGridView_Sorted(sender As Object, e As EventArgs) Handles RiepilogoGeneraleDTDataGridView.Sorted
        For Each Row As DataGridViewRow In RiepilogoGeneraleDTDataGridView.Rows
            Row.Cells(1).Value = StatoImageList.Images(CInt(Row.Cells(10).Value))
        Next
    End Sub


End Class
