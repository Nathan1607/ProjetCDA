<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Gantt.aspx.cs" Inherits="ProjetEurial.Gantt" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>

        <h1>Diagramme de Gantt</h1>

        <canvas id="graph"></canvas>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>

    </main>

    <!-- Affichage du diagramme de Gantt -->
    <script>
        const graph = document.getElementById("graph").getContext("2d");

        let massPopChart = new Chart(graph, {
            type: "bar",
            data: {
                labels: [
                    "arrivage dans l\'entrepot",
                    "mise en production",
                    "chaine de production",
                    "reception des pièces",
                    "départ de l\'entrepot",
                    "Reception magasin",
                    "mise en place magasin",
                ],
                datasets: [
                    {
                        label: "Cycle Pièces",
                        data: [
                            ['2022-02-01', '2022-02-03'],
                            ['2022-02-03', '2022-02-06'],
                            ['2022-02-06', '2022-02-07'],
                            ['2022-02-07', '2022-02-09'],
                            ['2022-02-09', '2022-02-13'],
                            ['2022-02-13', '2022-02-15'],
                            ['2022-02-15', '2022-02-21']
                        ],
                        barPercentage: 0.2,
                    },
                ],
            },
            options: {
                indexAxis: 'y',
                scales: {
                    x: {
                        min: '2022-02-01',
                        type: 'time',
                        time: {
                            unit: 'day'
                        }
                    },
                    y: {
                        beginAtZero: true
                    }
                },
            },
        });
    </script>

</asp:Content>

